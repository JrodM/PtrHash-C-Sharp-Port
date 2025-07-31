//! Hash function builders for FFI operations

use crate::{bucket_fn, hash, PtrHash, PtrHashParams};
use std::ffi::c_void;

/// Trait for abstracting over different hash functions in FFI
pub trait U64PtrHashBuilder {
    fn build(keys: &[u64], params: PtrHashParams<bucket_fn::Linear>) -> *mut c_void;
    fn drop_fn() -> unsafe extern "C" fn(*mut c_void);
}

/// Implementation for FxHash (default)
pub struct FxHashBuilder;
impl U64PtrHashBuilder for FxHashBuilder {
    fn build(keys: &[u64], params: PtrHashParams<bucket_fn::Linear>) -> *mut c_void {
        let mphf = PtrHash::<u64, bucket_fn::Linear, Vec<u32>, hash::FxHash, Vec<u8>>::new(keys, params);
        let boxed = Box::new(mphf);
        Box::into_raw(boxed) as *mut c_void
    }
    
    fn drop_fn() -> unsafe extern "C" fn(*mut c_void) {
        drop_ptrhash_u64_fxhash
    }
}

/// Implementation for StrongerIntHash
pub struct StrongerIntHashBuilder;
impl U64PtrHashBuilder for StrongerIntHashBuilder {
    fn build(keys: &[u64], params: PtrHashParams<bucket_fn::Linear>) -> *mut c_void {
        let mphf = PtrHash::<u64, bucket_fn::Linear, Vec<u32>, hash::StrongerIntHash, Vec<u8>>::new(keys, params);
        let boxed = Box::new(mphf);
        Box::into_raw(boxed) as *mut c_void
    }
    
    fn drop_fn() -> unsafe extern "C" fn(*mut c_void) {
        drop_ptrhash_u64_stronger
    }
}

/// Implementation for GxInt
pub struct GxIntHashBuilder;
impl U64PtrHashBuilder for GxIntHashBuilder {
    fn build(keys: &[u64], params: PtrHashParams<bucket_fn::Linear>) -> *mut c_void {
        let mphf = PtrHash::<u64, bucket_fn::Linear, Vec<u32>, hash::GxInt, Vec<u8>>::new(keys, params);
        let boxed = Box::new(mphf);
        Box::into_raw(boxed) as *mut c_void
    }
    
    fn drop_fn() -> unsafe extern "C" fn(*mut c_void) {
        drop_ptrhash_u64_gxint
    }
}

/// Implementation for Xxh3Int
pub struct Xxh3IntHashBuilder;
impl U64PtrHashBuilder for Xxh3IntHashBuilder {
    fn build(keys: &[u64], params: PtrHashParams<bucket_fn::Linear>) -> *mut c_void {
        let mphf = PtrHash::<u64, bucket_fn::Linear, Vec<u32>, hash::Xxh3Int, Vec<u8>>::new(keys, params);
        let boxed = Box::new(mphf);
        Box::into_raw(boxed) as *mut c_void
    }
    
    fn drop_fn() -> unsafe extern "C" fn(*mut c_void) {
        drop_ptrhash_u64_xxh3int
    }
}

/// Implementation for NoHash
pub struct NoHashBuilder;
impl U64PtrHashBuilder for NoHashBuilder {
    fn build(keys: &[u64], params: PtrHashParams<bucket_fn::Linear>) -> *mut c_void {
        let mphf = PtrHash::<u64, bucket_fn::Linear, Vec<u32>, hash::NoHash, Vec<u8>>::new(keys, params);
        let boxed = Box::new(mphf);
        Box::into_raw(boxed) as *mut c_void
    }
    
    fn drop_fn() -> unsafe extern "C" fn(*mut c_void) {
        drop_ptrhash_u64_nohash
    }
}

/// Build with the specified hash function
pub fn build_u64_ptrhash(keys: &[u64], params: PtrHashParams<bucket_fn::Linear>, hash_function: u32) -> Result<*mut c_void, &'static str> {
    match hash_function {
        0 => Ok(FxHashBuilder::build(keys, params)),
        1 => Ok(StrongerIntHashBuilder::build(keys, params)),
        2 => Ok(GxIntHashBuilder::build(keys, params)),
        3 => Ok(Xxh3IntHashBuilder::build(keys, params)),
        4 => Ok(NoHashBuilder::build(keys, params)),
        _ => Err("Unsupported hash function"),
    }
}

/// Get the appropriate drop function for the hash function
pub fn get_u64_drop_fn(hash_function: u32) -> Result<unsafe extern "C" fn(*mut c_void), &'static str> {
    match hash_function {
        0 => Ok(FxHashBuilder::drop_fn()),
        1 => Ok(StrongerIntHashBuilder::drop_fn()),
        2 => Ok(GxIntHashBuilder::drop_fn()),
        3 => Ok(Xxh3IntHashBuilder::drop_fn()),
        4 => Ok(NoHashBuilder::drop_fn()),
        _ => Err("Unsupported hash function"),
    }
}

// Drop function implementations
unsafe extern "C" fn drop_ptrhash_u64_fxhash(ptr: *mut c_void) {
    if !ptr.is_null() {
        let _ = Box::from_raw(ptr as *mut PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::FxHash, Vec<u8>>);
    }
}

unsafe extern "C" fn drop_ptrhash_u64_stronger(ptr: *mut c_void) {
    if !ptr.is_null() {
        let _ = Box::from_raw(ptr as *mut PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::StrongerIntHash, Vec<u8>>);
    }
}

unsafe extern "C" fn drop_ptrhash_u64_gxint(ptr: *mut c_void) {
    if !ptr.is_null() {
        let _ = Box::from_raw(ptr as *mut PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::GxInt, Vec<u8>>);
    }
}

unsafe extern "C" fn drop_ptrhash_u64_xxh3int(ptr: *mut c_void) {
    if !ptr.is_null() {
        let _ = Box::from_raw(ptr as *mut PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::Xxh3Int, Vec<u8>>);
    }
}

unsafe extern "C" fn drop_ptrhash_u64_nohash(ptr: *mut c_void) {
    if !ptr.is_null() {
        let _ = Box::from_raw(ptr as *mut PtrHash<u64, bucket_fn::Linear, Vec<u32>, hash::NoHash, Vec<u8>>);
    }
}

// Keep the old function for backward compatibility
#[allow(dead_code)]
unsafe extern "C" fn drop_ptrhash_u64(ptr: *mut c_void) {
    drop_ptrhash_u64_fxhash(ptr);
}

/// Drop function for string PtrHash
pub unsafe extern "C" fn drop_ptrhash_string(ptr: *mut c_void) {
    type StringPtrHash = PtrHash<String, bucket_fn::Linear, Vec<u32>, hash::StringHash, Vec<u8>>;
    if !ptr.is_null() {
        let _ = Box::from_raw(ptr as *mut StringPtrHash);
    }
}