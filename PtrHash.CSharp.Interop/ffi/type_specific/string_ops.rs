//! String key operations for FFI

use crate::{bucket_fn, hash, PtrHash, PtrHashParams};
use crate::ffi::types::*;
use crate::ffi::hash_builders::drop_ptrhash_string;
use std::ffi::c_void;
use std::slice;

/// Create a new PtrHash instance for string keys
#[no_mangle]
pub unsafe extern "C" fn ptrhash_new_string(
    keys: *const *const u8,
    key_lengths: *const usize,
    n: usize,
    params: FFIParams,
) -> FFIResultHandle {
    if keys.is_null() || key_lengths.is_null() || n == 0 {
        return error_result_handle("Invalid input: null keys or zero length");
    }

    let keys_ptrs = slice::from_raw_parts(keys, n);
    let lengths = slice::from_raw_parts(key_lengths, n);
    
    // Convert to string slices
    let mut string_keys = Vec::with_capacity(n);
    for i in 0..n {
        if keys_ptrs[i].is_null() {
            return error_result_handle("Null string key");
        }
        let bytes = slice::from_raw_parts(keys_ptrs[i], lengths[i]);
        match std::str::from_utf8(bytes) {
            Ok(s) => string_keys.push(s),
            Err(_) => return error_result_handle("Invalid UTF-8 string"),
        }
    }
    
    let mut hash_params = match params.default_param_set {
        0 => PtrHashParams::default(),           // Custom - use overrides
        1 => PtrHashParams::default_fast(),      // Fast preset (3.0 bits/key)
        _ => return error_result_handle("Invalid default_param_set. Use 0=custom, 1=fast"),
    };
    
    // Apply optional overrides only if explicitly set
    if params.has_override_lambda != 0 {
        hash_params.lambda = params.override_lambda;
    }
    if params.has_override_single_part != 0 {
        hash_params.single_part = params.override_single_part;
    }

    // Use String instead of str to avoid Sized trait issues
    let owned_keys: Vec<String> = string_keys.iter().map(|&s| s.to_string()).collect();

    match std::panic::catch_unwind(|| {
        <PtrHash<String, bucket_fn::Linear, Vec<u32>, hash::StringHash, Vec<u8>>>::new(&owned_keys, hash_params)
    }) {
        Ok(mphf) => {
            let boxed = Box::new(mphf);
            let ptr = Box::into_raw(boxed) as *mut c_void;
            
            // Store hash function for consistency (strings always use StringHash)
            let hash_function = if params.has_override_hash_function != 0 {
                params.override_hash_function
            } else {
                0 // Default value
            };
            
            let handle = Box::new(PtrHashHandle {
                ptr,
                drop_fn: drop_ptrhash_string,
                hash_function, // For tracking purposes
            });
            
            FFIResultHandle {
                success: true,
                value: Box::into_raw(handle),
                error_msg: std::ptr::null(),
                error_len: 0,
            }
        }
        Err(panic_info) => {
            let error_msg = if let Some(s) = panic_info.downcast_ref::<&str>() {
                format!("Panic during string construction: {}", s)
            } else if let Some(s) = panic_info.downcast_ref::<String>() {
                format!("Panic during string construction: {}", s)
            } else {
                "Panic during string construction: unknown error".to_string()
            };
            error_result_handle(&error_msg)
        }
    }
}

/// Query a single string key
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_string(
    handle: *const PtrHashHandle,
    key: *const u8,
    key_len: usize,
) -> FFIResultIndex {
    if handle.is_null() || key.is_null() {
        return error_result_index("Null pointer");
    }

    let handle = &*handle;
    type StringPtrHash = PtrHash<String, bucket_fn::Linear, Vec<u32>, hash::StringHash, Vec<u8>>;
    let mphf = &*(handle.ptr as *const StringPtrHash);
    
    let key_bytes = slice::from_raw_parts(key, key_len);
    match std::str::from_utf8(key_bytes) {
        Ok(key_str) => {
            let owned_key = key_str.to_string();
            FFIResultIndex {
                success: true,
                value: mphf.index(&owned_key),
                error_msg: std::ptr::null(),
                error_len: 0,
            }
        },
        Err(_) => error_result_index("Invalid UTF-8 string"),
    }
}

/// Query a single string key without remapping (can return values >= n)
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_no_remap_string(
    handle: *const PtrHashHandle,
    key: *const u8,
    key_len: usize,
) -> FFIResultIndex {
    if handle.is_null() || key.is_null() {
        return error_result_index("Null pointer");
    }

    let handle = &*handle;
    type StringPtrHash = PtrHash<String, bucket_fn::Linear, Vec<u32>, hash::StringHash, Vec<u8>>;
    let mphf = &*(handle.ptr as *const StringPtrHash);
    
    let key_bytes = slice::from_raw_parts(key, key_len);
    match std::str::from_utf8(key_bytes) {
        Ok(key_str) => {
            let owned_key = key_str.to_string();
            FFIResultIndex {
                success: true,
                value: mphf.index_no_remap(&owned_key),
                error_msg: std::ptr::null(),
                error_len: 0,
            }
        },
        Err(_) => error_result_index("Invalid UTF-8 string"),
    }
}

/// Batch query multiple string keys
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_batch_string(
    handle: *const PtrHashHandle,
    keys: *const *const u8,
    key_lengths: *const usize,
    n: usize,
    results: *mut usize,
    minimal: bool,
) -> FFIResultVoid {
    if handle.is_null() || keys.is_null() || key_lengths.is_null() || results.is_null() {
        return error_result_void("Null pointer");
    }

    let handle = &*handle;
    type StringPtrHash = PtrHash<String, bucket_fn::Linear, Vec<u32>, hash::StringHash, Vec<u8>>;
    let mphf = &*(handle.ptr as *const StringPtrHash);
    
    let keys_ptrs = slice::from_raw_parts(keys, n);
    let lengths = slice::from_raw_parts(key_lengths, n);
    let results_slice = slice::from_raw_parts_mut(results, n);
    
    for i in 0..n {
        if keys_ptrs[i].is_null() {
            return error_result_void("Null string key");
        }
        
        let key_bytes = slice::from_raw_parts(keys_ptrs[i], lengths[i]);
        match std::str::from_utf8(key_bytes) {
            Ok(key_str) => {
                let owned_key = key_str.to_string();
                results_slice[i] = if minimal {
                    mphf.index(&owned_key)
                } else {
                    mphf.index_no_remap(&owned_key)
                };
            },
            Err(_) => return error_result_void("Invalid UTF-8 string"),
        }
    }
    
    FFIResultVoid {
        success: true,
        value: 0,
        error_msg: std::ptr::null(),
        error_len: 0,
    }
}

/// Stream query multiple string keys with prefetching
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_stream_string(
    handle: *const PtrHashHandle,
    keys: *const *const u8,
    key_lengths: *const usize,
    n: usize,
    results: *mut usize,
    prefetch_distance: usize,
    minimal: bool,
) -> FFIResultVoid {
    if handle.is_null() || keys.is_null() || key_lengths.is_null() || results.is_null() {
        return error_result_void("Null pointer");
    }

    let handle = &*handle;
    type StringPtrHash = PtrHash<String, bucket_fn::Linear, Vec<u32>, hash::StringHash, Vec<u8>>;
    let mphf = &*(handle.ptr as *const StringPtrHash);
    
    let keys_ptrs = slice::from_raw_parts(keys, n);
    let lengths = slice::from_raw_parts(key_lengths, n);
    let results_slice = slice::from_raw_parts_mut(results, n);
    
    // Convert to string keys first
    let mut string_keys = Vec::with_capacity(n);
    for i in 0..n {
        if keys_ptrs[i].is_null() {
            return error_result_void("Null string key");
        }
        
        let key_bytes = slice::from_raw_parts(keys_ptrs[i], lengths[i]);
        match std::str::from_utf8(key_bytes) {
            Ok(key_str) => {
                string_keys.push(key_str.to_string());
            },
            Err(_) => return error_result_void("Invalid UTF-8 string"),
        }
    }
    
    // Normalize prefetch distance (same logic as u64 version)
    let _distance = match prefetch_distance {
        d if d <= 8 => 8,
        d if d <= 16 => 16,
        d if d <= 32 => 32,
        d if d <= 64 => 64,
        _ => 32,
    };
    
    // Process with streaming - for now use simple iteration since string streaming might not be as optimized
    for (i, key) in string_keys.iter().enumerate() {
        results_slice[i] = if minimal {
            mphf.index(key)
        } else {
            mphf.index_no_remap(key)
        };
    }
    
    FFIResultVoid {
        success: true,
        value: 0,
        error_msg: std::ptr::null(),
        error_len: 0,
    }
}