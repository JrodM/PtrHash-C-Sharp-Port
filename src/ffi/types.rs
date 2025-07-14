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

/// Parameters for PtrHash construction
#[repr(C)]
pub struct FFIParams {
    pub param_set: u32, // 0=default, 1=fast
    pub single_part: bool,
    pub lambda: f64, // Lambda parameter (to modify baseline settings)
    pub u64_hash_function: u32, // Hash function for u64 keys
    pub string_hash_function: u32, // Hash function for string keys
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