//! Type-specific FFI operations for different key types

pub mod u64_ops;
pub mod string_ops;
pub mod int_ops;

// Re-export all type-specific functions
pub use u64_ops::*;
pub use string_ops::*;
pub use int_ops::*;