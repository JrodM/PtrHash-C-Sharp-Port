//! FFI types and structures for C# interop

use std::ffi::c_void;

/// Opaque handle to a PtrHash instance
pub struct PtrHashHandle {
    pub ptr: *mut c_void,
    pub drop_fn: unsafe extern "C" fn(*mut c_void),
    pub hash_function: u32, // Store the hash function type for queries
}

/// Result type for handle operations
#[repr(C)]
pub struct FFIResultHandle {
    pub success: bool,
    pub value: *mut PtrHashHandle,
    pub error_msg: *const u8,
    pub error_len: usize,
}

/// Result type for index operations
#[repr(C)]
pub struct FFIResultIndex {
    pub success: bool,
    pub value: usize,
    pub error_msg: *const u8,
    pub error_len: usize,
}

/// Result type for void operations
#[repr(C)]
pub struct FFIResultVoid {
    pub success: bool,
    pub value: u8, // Dummy value
    pub error_msg: *const u8,
    pub error_len: usize,
}

/// Information about PtrHash instance
#[repr(C)]
pub struct PtrHashInfo {
    pub n: usize,
    pub bits_per_key: f64,
    pub max_index: usize,
}

/// Result type for info operations
#[repr(C)]
pub struct FFIResultInfo {
    pub success: bool,
    pub value: PtrHashInfo,
    pub error_msg: *const u8,
    pub error_len: usize,
}

/// Parameters for PtrHash construction with optional overrides
#[repr(C)]
pub struct FFIParams {
    pub default_param_set: u32, // 0=custom, 1=fast
    // Optional override flags (1=set, 0=use preset default)
    pub has_override_single_part: u8,
    pub has_override_lambda: u8,
    pub has_override_hash_function: u8,
    pub has_override_bucket_function: u8,
    // Override values (only used if corresponding has_override_* is 1)
    pub override_single_part: bool,
    pub override_lambda: f64,
    pub override_hash_function: u32,
    pub override_bucket_function: u32,
}

/// Helper functions for creating error results
pub fn error_result_handle(msg: &str) -> FFIResultHandle {
    let error = msg.as_bytes().to_vec();
    let len = error.len();
    let ptr = error.as_ptr();
    std::mem::forget(error);
    
    FFIResultHandle {
        success: false,
        value: std::ptr::null_mut(),
        error_msg: ptr,
        error_len: len,
    }
}

pub fn error_result_index(msg: &str) -> FFIResultIndex {
    let error = msg.as_bytes().to_vec();
    let len = error.len();
    let ptr = error.as_ptr();
    std::mem::forget(error);
    
    FFIResultIndex {
        success: false,
        value: 0,
        error_msg: ptr,
        error_len: len,
    }
}

pub fn error_result_void(msg: &str) -> FFIResultVoid {
    let error = msg.as_bytes().to_vec();
    let len = error.len();
    let ptr = error.as_ptr();
    std::mem::forget(error);
    
    FFIResultVoid {
        success: false,
        value: 0,
        error_msg: ptr,
        error_len: len,
    }
}

pub fn error_result_info(msg: &str) -> FFIResultInfo {
    let error = msg.as_bytes().to_vec();
    let len = error.len();
    let ptr = error.as_ptr();
    std::mem::forget(error);
    
    FFIResultInfo {
        success: false,
        value: PtrHashInfo {
            n: 0,
            bits_per_key: 0.0,
            max_index: 0,
        },
        error_msg: ptr,
        error_len: len,
    }
}