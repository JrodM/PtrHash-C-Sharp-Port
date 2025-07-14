//! FFI module for C# interop with zero-copy operations where possible.

pub mod types;
pub mod hash_builders;
pub mod u64_ops;
pub mod string_ops;
pub mod memory;

// Re-export all public functions for C FFI
pub use u64_ops::*;
pub use string_ops::*;
pub use memory::*;