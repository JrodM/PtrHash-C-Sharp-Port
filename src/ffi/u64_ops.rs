//! U64 key operations for FFI

use crate::{bucket_fn, hash, DefaultPtrHash, PtrHash, PtrHashParams};
use super::types::*;
use super::hash_builders::*;
use std::ffi::c_void;
use std::slice;

/// Create a new PtrHash instance for u64 keys
#[no_mangle]
pub unsafe extern "C" fn ptrhash_new_u64(
    keys: *const u64,
    n: usize,
    params: FFIParams,
) -> FFIResultHandle {
    if keys.is_null() || n == 0 {
        return error_result_handle("Invalid input: null keys or zero length");
    }

    let keys_slice = slice::from_raw_parts(keys, n);
    
    let mut hash_params = match params.param_set {
        0 => PtrHashParams::default(),           // 3.0 bits/key, Linear bucket fn
        1 => PtrHashParams::default_fast(),      // 3.0 bits/key, Linear bucket fn, fast construction
        _ => return error_result_handle("Invalid param_set. Use 0=default, 1=fast"),
    };
    
    // Apply individual overrides regardless of parameter set
    if params.lambda > 0.0 {
        hash_params.lambda = params.lambda;
    }
    hash_params.single_part = params.single_part;

    match std::panic::catch_unwind(|| {
        build_u64_ptrhash(keys_slice, hash_params, params.u64_hash_function)
    }) {
        Ok(Ok(ptr)) => {
            let drop_fn = match get_u64_drop_fn(params.u64_hash_function) {
                Ok(f) => f,
                Err(e) => return error_result_handle(e),
            };
            
            let handle = Box::new(PtrHashHandle {
                ptr,
                drop_fn,
                hash_function: params.u64_hash_function,
            });
            
            FFIResultHandle {
                success: true,
                value: Box::into_raw(handle),
                error_msg: std::ptr::null(),
                error_len: 0,
            }
        }
        Ok(Err(e)) => {
            error_result_handle(e)
        }
        Err(panic_info) => {
            let error_msg = if let Some(s) = panic_info.downcast_ref::<&str>() {
                format!("Panic during construction: {}", s)
            } else if let Some(s) = panic_info.downcast_ref::<String>() {
                format!("Panic during construction: {}", s)
            } else {
                "Panic during construction: unknown error".to_string()
            };
            error_result_handle(&error_msg)
        }
    }
}

/// Query dispatch function
unsafe fn query_u64_index(ptr: *const c_void, hash_function: u32, key: u64) -> Result<usize, &'static str> {
    match hash_function {
        0 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::FxHash, Vec<u8>>);
            Ok(mphf.index(&key))
        }
        1 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::StrongerIntHash, Vec<u8>>);
            Ok(mphf.index(&key))
        }
        2 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::GxInt, Vec<u8>>);
            Ok(mphf.index(&key))
        }
        3 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::Xxh3Int, Vec<u8>>);
            Ok(mphf.index(&key))
        }
        4 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::NoHash, Vec<u8>>);
            Ok(mphf.index(&key))
        }
        _ => Err("Unsupported hash function"),
    }
}

/// Query dispatch function for no-remap
unsafe fn query_u64_index_no_remap(ptr: *const c_void, hash_function: u32, key: u64) -> Result<usize, &'static str> {
    match hash_function {
        0 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::FxHash, Vec<u8>>);
            Ok(mphf.index_no_remap(&key))
        }
        1 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::StrongerIntHash, Vec<u8>>);
            Ok(mphf.index_no_remap(&key))
        }
        2 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::GxInt, Vec<u8>>);
            Ok(mphf.index_no_remap(&key))
        }
        3 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::Xxh3Int, Vec<u8>>);
            Ok(mphf.index_no_remap(&key))
        }
        4 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::NoHash, Vec<u8>>);
            Ok(mphf.index_no_remap(&key))
        }
        _ => Err("Unsupported hash function"),
    }
}

/// Query a single key
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_u64(
    handle: *const PtrHashHandle,
    key: u64,
) -> FFIResultIndex {
    if handle.is_null() {
        return error_result_index("Null handle");
    }

    let handle = &*handle;
    match query_u64_index(handle.ptr, handle.hash_function, key) {
        Ok(index) => FFIResultIndex {
            success: true,
            value: index,
            error_msg: std::ptr::null(),
            error_len: 0,
        },
        Err(e) => error_result_index(e),
    }
}

/// Query a single key without remapping (can return values >= n)
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_no_remap_u64(
    handle: *const PtrHashHandle,
    key: u64,
) -> FFIResultIndex {
    if handle.is_null() {
        return error_result_index("Null handle");
    }

    let handle = &*handle;
    match query_u64_index_no_remap(handle.ptr, handle.hash_function, key) {
        Ok(index) => FFIResultIndex {
            success: true,
            value: index,
            error_msg: std::ptr::null(),
            error_len: 0,
        },
        Err(e) => error_result_index(e),
    }
}

/// Query dispatch function for batch operations
unsafe fn query_u64_index_batch(
    ptr: *const c_void, 
    hash_function: u32, 
    keys: &[u64], 
    results: &mut [usize], 
    minimal: bool
) -> Result<(), &'static str> {
    match hash_function {
        0 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::FxHash, Vec<u8>>);
            batch_process_with_mphf(mphf, keys, results, minimal);
            Ok(())
        }
        1 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::StrongerIntHash, Vec<u8>>);
            batch_process_with_mphf(mphf, keys, results, minimal);
            Ok(())
        }
        2 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::GxInt, Vec<u8>>);
            batch_process_with_mphf(mphf, keys, results, minimal);
            Ok(())
        }
        3 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::Xxh3Int, Vec<u8>>);
            batch_process_with_mphf(mphf, keys, results, minimal);
            Ok(())
        }
        4 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::NoHash, Vec<u8>>);
            batch_process_with_mphf(mphf, keys, results, minimal);
            Ok(())
        }
        _ => Err("Unsupported hash function"),
    }
}

fn batch_process_with_mphf<Hx: crate::hash::KeyHasher<u64>>(
    mphf: &crate::PtrHash<u64, crate::bucket_fn::Linear, Vec<u32>, Hx, Vec<u8>>,
    keys: &[u64],
    results: &mut [usize],
    minimal: bool
) {
    const CHUNK_SIZE: usize = 16;
    
    for (i, chunk) in keys.chunks(CHUNK_SIZE).enumerate() {
        let start = i * CHUNK_SIZE;
        let end = (start + chunk.len()).min(keys.len());
        
        if chunk.len() == CHUNK_SIZE {
            // Full chunk - use optimized batch method
            let mut batch: [u64; CHUNK_SIZE] = [0; CHUNK_SIZE];
            batch[..chunk.len()].copy_from_slice(chunk);
            
            let indices = if minimal {
                mphf.index_batch::<CHUNK_SIZE, true, _>(batch)
            } else {
                mphf.index_batch::<CHUNK_SIZE, false, _>(batch)
            };
            
            results[start..end].copy_from_slice(&indices[..chunk.len()]);
        } else {
            // Partial chunk - process individually
            for (j, &key) in chunk.iter().enumerate() {
                results[start + j] = if minimal {
                    mphf.index(&key)
                } else {
                    mphf.index_no_remap(&key)
                };
            }
        }
    }
}

/// Batch query multiple keys
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_batch_u64(
    handle: *const PtrHashHandle,
    keys: *const u64,
    n: usize,
    results: *mut usize,
    minimal: bool,
) -> FFIResultVoid {
    if handle.is_null() || keys.is_null() || results.is_null() {
        return error_result_void("Null pointer");
    }

    let handle = &*handle;
    let keys_slice = slice::from_raw_parts(keys, n);
    let results_slice = slice::from_raw_parts_mut(results, n);
    
    match query_u64_index_batch(handle.ptr, handle.hash_function, keys_slice, results_slice, minimal) {
        Ok(()) => FFIResultVoid {
            success: true,
            value: 0,
            error_msg: std::ptr::null(),
            error_len: 0,
        },
        Err(e) => error_result_void(e),
    }
}

/// Query dispatch function for streaming
unsafe fn query_u64_index_stream(
    ptr: *const c_void, 
    hash_function: u32, 
    keys: &[u64], 
    results: &mut [usize], 
    prefetch_distance: usize, 
    minimal: bool
) -> Result<(), &'static str> {
    // Common fold function that stores indices in the results array
    let store_results = |idx: usize, index: usize| -> usize {
        if idx < results.len() {
            results[idx] = index;
            idx + 1
        } else {
            idx
        }
    };

    // Normalize prefetch distance
    let distance = match prefetch_distance {
        d if d <= 8 => 8,
        d if d <= 16 => 16,
        d if d <= 32 => 32,
        d if d <= 64 => 64,
        _ => 32,
    };

    match hash_function {
        0 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::FxHash, Vec<u8>>);
            match (distance, minimal) {
                (8, true) => { mphf.index_stream::<8, true, _>(keys).fold(0, store_results); }
                (8, false) => { mphf.index_stream::<8, false, _>(keys).fold(0, store_results); }
                (16, true) => { mphf.index_stream::<16, true, _>(keys).fold(0, store_results); }
                (16, false) => { mphf.index_stream::<16, false, _>(keys).fold(0, store_results); }
                (32, true) => { mphf.index_stream::<32, true, _>(keys).fold(0, store_results); }
                (32, false) => { mphf.index_stream::<32, false, _>(keys).fold(0, store_results); }
                (64, true) => { mphf.index_stream::<64, true, _>(keys).fold(0, store_results); }
                (64, false) => { mphf.index_stream::<64, false, _>(keys).fold(0, store_results); }
                _ => unreachable!()
            }
            Ok(())
        }
        1 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::StrongerIntHash, Vec<u8>>);
            match (distance, minimal) {
                (8, true) => { mphf.index_stream::<8, true, _>(keys).fold(0, store_results); }
                (8, false) => { mphf.index_stream::<8, false, _>(keys).fold(0, store_results); }
                (16, true) => { mphf.index_stream::<16, true, _>(keys).fold(0, store_results); }
                (16, false) => { mphf.index_stream::<16, false, _>(keys).fold(0, store_results); }
                (32, true) => { mphf.index_stream::<32, true, _>(keys).fold(0, store_results); }
                (32, false) => { mphf.index_stream::<32, false, _>(keys).fold(0, store_results); }
                (64, true) => { mphf.index_stream::<64, true, _>(keys).fold(0, store_results); }
                (64, false) => { mphf.index_stream::<64, false, _>(keys).fold(0, store_results); }
                _ => unreachable!()
            }
            Ok(())
        }
        2 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::GxInt, Vec<u8>>);
            match (distance, minimal) {
                (8, true) => { mphf.index_stream::<8, true, _>(keys).fold(0, store_results); }
                (8, false) => { mphf.index_stream::<8, false, _>(keys).fold(0, store_results); }
                (16, true) => { mphf.index_stream::<16, true, _>(keys).fold(0, store_results); }
                (16, false) => { mphf.index_stream::<16, false, _>(keys).fold(0, store_results); }
                (32, true) => { mphf.index_stream::<32, true, _>(keys).fold(0, store_results); }
                (32, false) => { mphf.index_stream::<32, false, _>(keys).fold(0, store_results); }
                (64, true) => { mphf.index_stream::<64, true, _>(keys).fold(0, store_results); }
                (64, false) => { mphf.index_stream::<64, false, _>(keys).fold(0, store_results); }
                _ => unreachable!()
            }
            Ok(())
        }
        3 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::Xxh3Int, Vec<u8>>);
            match (distance, minimal) {
                (8, true) => { mphf.index_stream::<8, true, _>(keys).fold(0, store_results); }
                (8, false) => { mphf.index_stream::<8, false, _>(keys).fold(0, store_results); }
                (16, true) => { mphf.index_stream::<16, true, _>(keys).fold(0, store_results); }
                (16, false) => { mphf.index_stream::<16, false, _>(keys).fold(0, store_results); }
                (32, true) => { mphf.index_stream::<32, true, _>(keys).fold(0, store_results); }
                (32, false) => { mphf.index_stream::<32, false, _>(keys).fold(0, store_results); }
                (64, true) => { mphf.index_stream::<64, true, _>(keys).fold(0, store_results); }
                (64, false) => { mphf.index_stream::<64, false, _>(keys).fold(0, store_results); }
                _ => unreachable!()
            }
            Ok(())
        }
        4 => {
            let mphf = &*(ptr as *const PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::NoHash, Vec<u8>>);
            match (distance, minimal) {
                (8, true) => { mphf.index_stream::<8, true, _>(keys).fold(0, store_results); }
                (8, false) => { mphf.index_stream::<8, false, _>(keys).fold(0, store_results); }
                (16, true) => { mphf.index_stream::<16, true, _>(keys).fold(0, store_results); }
                (16, false) => { mphf.index_stream::<16, false, _>(keys).fold(0, store_results); }
                (32, true) => { mphf.index_stream::<32, true, _>(keys).fold(0, store_results); }
                (32, false) => { mphf.index_stream::<32, false, _>(keys).fold(0, store_results); }
                (64, true) => { mphf.index_stream::<64, true, _>(keys).fold(0, store_results); }
                (64, false) => { mphf.index_stream::<64, false, _>(keys).fold(0, store_results); }
                _ => unreachable!()
            }
            Ok(())
        }
        _ => Err("Unsupported hash function"),
    }
}

/// Process a streaming batch of keys with prefetching
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_stream_u64(
    handle: *const PtrHashHandle,
    keys: *const u64,
    n: usize,
    results: *mut usize,
    prefetch_distance: usize,
    minimal: bool,
) -> FFIResultVoid {
    if handle.is_null() || keys.is_null() || results.is_null() {
        return error_result_void("Null pointer");
    }

    let handle = &*handle;
    let keys_slice = slice::from_raw_parts(keys, n);
    let results_slice = slice::from_raw_parts_mut(results, n);
    
    // Dispatch to the correct hash function
    match query_u64_index_stream(handle.ptr, handle.hash_function, keys_slice, results_slice, prefetch_distance, minimal) {
        Ok(()) => FFIResultVoid {
            success: true,
            value: 0,
            error_msg: std::ptr::null(),
            error_len: 0,
        },
        Err(e) => error_result_void(e),
    }
}

/// Get information about the PtrHash instance
#[no_mangle]
pub unsafe extern "C" fn ptrhash_info_u64(
    handle: *const PtrHashHandle,
) -> FFIResultInfo {
    if handle.is_null() {
        return error_result_info("Null handle");
    }

    let handle = &*handle;
    let mphf = &*(handle.ptr as *const DefaultPtrHash);
    
    FFIResultInfo {
        success: true,
        value: PtrHashInfo {
            n: mphf.n(),
            bits_per_key: mphf.bits_per_element().0, // Use first element of tuple
            max_index: mphf.max_index(),
        },
        error_msg: std::ptr::null(),
        error_len: 0,
    }
}