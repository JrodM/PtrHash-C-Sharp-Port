use crate::ffi::types::{FFIParams, FFIResultHandle, FFIResultIndex, FFIResultInfo, FFIResultVoid};
use std::ffi::c_void;

/// Create a new PtrHash for int keys (treated as u64 internally)
/// 
/// # Arguments
/// * `keys` - Pointer to array of int keys
/// * `n` - Number of keys
/// * `params` - Construction parameters
/// 
/// # Returns
/// FFIResultHandle containing the PtrHash handle or error information
#[no_mangle]
pub unsafe extern "C" fn ptrhash_new_int(
    keys: *const i32,
    n: usize,
    params: FFIParams,
) -> FFIResultHandle {
    if keys.is_null() || n == 0 {
        return crate::ffi::types::error_result_handle("Keys pointer is null or count is zero");
    }

    // Convert int keys to u64 keys (preserve bit pattern via uint cast)
    let keys_slice = std::slice::from_raw_parts(keys, n);
    let u64_keys: Vec<u64> = keys_slice.iter()
        .map(|&k| k as u32 as u64) // Cast to u32 first to preserve bit pattern
        .collect();

    // Delegate to u64 implementation
    super::u64_ops::ptrhash_new_u64(u64_keys.as_ptr(), n, params)
}

/// Get index for int key
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_int(
    handle: *mut c_void,
    key: i32,
) -> FFIResultIndex {
    // Convert int to u64 and delegate
    super::u64_ops::ptrhash_index_u64(handle as *const crate::ffi::types::PtrHashHandle, key as u32 as u64)
}

/// Get index for int key without remapping
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_no_remap_int(
    handle: *mut c_void,
    key: i32,
) -> FFIResultIndex {
    // Convert int to u64 and delegate
    super::u64_ops::ptrhash_index_no_remap_u64(handle as *const crate::ffi::types::PtrHashHandle, key as u32 as u64)
}

/// Batch lookup for int keys
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_batch_int(
    handle: *mut c_void,
    keys: *const i32,
    n: usize,
    results: *mut usize,
    minimal: bool,
) -> FFIResultVoid {
    if keys.is_null() || results.is_null() || n == 0 {
        return crate::ffi::types::error_result_void("Invalid parameters for batch lookup");
    }

    // Convert int keys to u64 keys
    let keys_slice = std::slice::from_raw_parts(keys, n);
    let u64_keys: Vec<u64> = keys_slice.iter()
        .map(|&k| k as u32 as u64)
        .collect();

    // Delegate to u64 implementation
    super::u64_ops::ptrhash_index_batch_u64(handle as *const crate::ffi::types::PtrHashHandle, u64_keys.as_ptr(), n, results, minimal)
}

/// Stream lookup for int keys with prefetching
#[no_mangle]
pub unsafe extern "C" fn ptrhash_index_stream_int(
    handle: *mut c_void,
    keys: *const i32,
    n: usize,
    results: *mut usize,
    prefetch_distance: usize,
    minimal: bool,
) -> FFIResultVoid {
    if keys.is_null() || results.is_null() || n == 0 {
        return crate::ffi::types::error_result_void("Invalid parameters for stream lookup");
    }

    // Convert int keys to u64 keys
    let keys_slice = std::slice::from_raw_parts(keys, n);
    let u64_keys: Vec<u64> = keys_slice.iter()
        .map(|&k| k as u32 as u64)
        .collect();

    // Delegate to u64 implementation
    super::u64_ops::ptrhash_index_stream_u64(handle as *const crate::ffi::types::PtrHashHandle, u64_keys.as_ptr(), n, results, prefetch_distance, minimal)
}

/// Get info for int-keyed PtrHash
#[no_mangle]
pub unsafe extern "C" fn ptrhash_info_int(
    handle: *mut c_void,
) -> FFIResultInfo {
    // Delegate to u64 implementation (same structure)
    super::u64_ops::ptrhash_info_u64(handle as *const crate::ffi::types::PtrHashHandle)
}