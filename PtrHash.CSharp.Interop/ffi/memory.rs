//! Memory management for FFI operations

use super::types::PtrHashHandle;

/// Free a PtrHash instance
#[no_mangle]
pub unsafe extern "C" fn ptrhash_free(handle: *mut PtrHashHandle) {
    if !handle.is_null() {
        let handle = Box::from_raw(handle);
        (handle.drop_fn)(handle.ptr);
    }
}

/// Free an error message
#[no_mangle]
pub unsafe extern "C" fn ptrhash_free_error(error_msg: *mut u8, error_len: usize) {
    if !error_msg.is_null() && error_len > 0 {
        let _ = Vec::from_raw_parts(error_msg, error_len, error_len);
    }
}