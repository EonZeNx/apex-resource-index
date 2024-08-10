// Created by EonZeNx
// Template types
#pragma once

import std.io;

namespace TTypes {
  struct Vector2<T> {
    T x [[export]];
    T y [[export]];
  } [[format("TTypes::Fmt::vec2_format")]];
  
  struct Vector3<T> {
    T x [[export]];
    T y [[export]];
    T z [[export]];
  } [[format("TTypes::Fmt::vec3_format")]];
  
  struct Vector4<T> {
    T x [[export]];
    T y [[export]];
    T z [[export]];
    T w [[export]];
  } [[format("TTypes::Fmt::vec4_format")]];
  
  
  struct Matrix3x3<T> {
    Vector3<T> a [[export]];
    Vector3<T> b [[export]];
    Vector3<T> c [[export]];
  } [[format("TTypes::Fmt::mat3x3_format")]];
  
  struct Matrix3x4<T> {
    Vector3<T> a [[export]];
    Vector3<T> b [[export]];
    Vector3<T> c [[export]];
    Vector3<T> d [[export]];
  } [[format("TTypes::Fmt::mat3x4_format")]];
  
  struct Matrix4x3<T> {
    Vector4<T> a [[export]];
    Vector4<T> b [[export]];
    Vector4<T> c [[export]];
  } [[format("TTypes::Fmt::mat4x3_format")]];
  
  struct Matrix4x4<T> {
    Vector4<T> a [[export]];
    Vector4<T> b [[export]];
    Vector4<T> c [[export]];
    Vector4<T> d [[export]];
  } [[format("TTypes::Fmt::mat4x4_format")]];
  
  
  struct Pair<T, U> {
    T a [[export]];
    U b [[export]];
  } [[format("TTypes::Fmt::pair_format")]];
  
  union Either<T, U> {
    T a [[export]];
    U b [[export]];
  } [[format("TTypes::Fmt::either_format")]];
  
  
  struct Option<T> {
    bool IsSome [[export]];
    T Data [[export]];
  } [[format("TTypes::Fmt::option_format")]];
  
  struct Array<T, U> {
    T Count [[export]];
    U Data [Count] [[export]];
  };
  
  
  namespace Fmt {
    fn vec2_format(ref auto vec) {
      return std::format("({:f}, {:f})", vec.x, vec.y);
    };

    fn vec3_format(ref auto vec) {
      return std::format("({:f}, {:f}, {:f})", vec.x, vec.y, vec.z);
    };

    fn vec4_format(ref auto vec) {
      return std::format("({:f}, {:f}, {:f}, {:f})", vec.x, vec.y, vec.z, vec.w);
    };
	
    fn mat3x3_format(ref auto mat) {
      return std::format("a: {}\nb: {}\nc: {}", mat.a, mat.b, mat.c);
    };
	
    fn mat3x4_format(ref auto mat) {
      return std::format("a: {}\nb: {}\nc: {}\nd: {}", mat.a, mat.b, mat.c, mat.d);
    };
	
    fn mat4x3_format(ref auto mat) {
      return std::format("a: {}\nb: {}\nc: {}", mat.a, mat.b, mat.c);
    };
	
    fn mat4x4_format(ref auto mat) {
      return std::format("a: {}\nb: {}\nc: {}\nd: {}", mat.a, mat.b, mat.c, mat.d);
    };
	
    fn pair_format(ref auto pair) {
      return std::format("{} <-> {}", pair.a, pair.b);
    };
	
    fn either_format(ref auto either) {
      return std::format("{} <-> {}", either.a, either.b);
    };
	
    fn option_format(ref auto option) {
      return std::format("IsSome {}", option.IsSome);
    };
  }
}

