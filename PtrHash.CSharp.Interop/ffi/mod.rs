//! FFI module for C# interop with zero-copy operations where possible.

pub mod types;
pub mod hash_builders;
pub mod type_specific;
pub mod memory;

// Re-export all public functions for C FFI
pub use type_specific::*;
pub use memory::*;