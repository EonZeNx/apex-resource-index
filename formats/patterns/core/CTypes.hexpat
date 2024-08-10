// Created by EonZeNx, Brooen
// Common types
#pragma once

import std.io;
import std.math;

import core.TTypes;

namespace CTypes {
  using FVector2 = TTypes::Vector2<float>;
  using FVector3 = TTypes::Vector3<float>;
  using FVector4 = TTypes::Vector4<float>;
  
  using FMatrix3x3 = TTypes::Matrix3x3<float>;
  using FMatrix3x4 = TTypes::Matrix3x4<float>;
  using FMatrix4x3 = TTypes::Matrix4x3<float>;
  using FMatrix4x4 = TTypes::Matrix4x4<float>;
  
    
  using UVector2 = TTypes::Vector2<u32>;
  using UVector3 = TTypes::Vector3<u32>;
  using UVector4 = TTypes::Vector4<u32>;
  
  using UMatrix3x3 = TTypes::Matrix3x3<u32>;
  using UMatrix3x4 = TTypes::Matrix3x4<u32>;
  using UMatrix4x3 = TTypes::Matrix4x3<u32>;
  using UMatrix4x4 = TTypes::Matrix4x4<u32>;
  
  
  using SVector2 = TTypes::Vector2<s32>;
  using SVector3 = TTypes::Vector3<s32>;
  using SVector4 = TTypes::Vector4<s32>;
  
  using SMatrix3x3 = TTypes::Matrix3x3<s32>;
  using SMatrix3x4 = TTypes::Matrix3x4<s32>;
  using SMatrix4x3 = TTypes::Matrix4x3<s32>;
  using SMatrix4x4 = TTypes::Matrix4x4<s32>;
  
  
  using U8Array  = TTypes::Array<u32, u8>;
  using U16Array = TTypes::Array<u32, u16>;
  using U32Array = TTypes::Array<u32, u32>;
  using U64Array = TTypes::Array<u32, u64>;
  
  using S8Array  = TTypes::Array<u32, s8>;
  using S16Array = TTypes::Array<u32, s16>;
  using S32Array = TTypes::Array<u32, s32>;
  using S64Array = TTypes::Array<u32, s64>;
  
  using F32Array = TTypes::Array<u32, float>;
  using F64Array = TTypes::Array<u32, double>;
  
  
  struct UV : TTypes::Vector2<float> {
    float u = x [[export]];
    float v = y [[export]];
  };
  
  using Position = TTypes::Vector3<float>;
  namespace Rotation {
    struct PYR : TTypes::Vector3<float> {
      float pitch = x [[export]];
      float yaw   = y [[export]];
      float roll  = z [[export]];
    };
    
    using Quat = TTypes::Vector4<float>;
  }
  using Scale = TTypes::Vector3<float>;
  
  
  struct FBox {
    FVector3 Min [[export]];
    FVector3 Max [[export]];
  };
  
  struct FBoxR {
    FVector3 Max [[export]];
    FVector3 Min [[export]];
  };
  
  namespace Colour {
    struct RGB {
      float r [[export]];
      float g [[export]];
      float b [[export]];
    } [[format("CTypes::Fmt::rgb_format")]];
	
    struct RGBA : RGB {
      float a [[export]];
    } [[format("CTypes::Fmt::rgba_format")]];
	
    struct HSL {
      float h [[export]];
      float s [[export]];
      float l [[export]];
    } [[format("CTypes::Fmt::hsl_format")]];
	
    struct HSV : HSL {
      float v = l [[export]];
    };
    struct HSB : HSL {
      float b = l [[export]];
    };
	
	namespace Fmt {
	  fn rgb_format(ref auto colour) {
	    return std::format("({:f}, {:f}, {:f})", colour.r, colour.g, colour.b);
	  };
	  
	  fn rgba_format(ref auto colour) {
	    return std::format("({:f}, {:f}, {:f}, {:f})", colour.r, colour.g, colour.b, colour.a);
	  };
	  
	  fn hsl_format(ref auto colour) {
	    return std::format("({:f}, {:f}, {:f})", colour.h, colour.s, colour.l);
	  };
	}
  }
  
  namespace Color {
    using RGB  = Colour::RGB;
    using RGBA = Colour::RGBA;
    using HSL  = Colour::HSL;
    using HSV  = Colour::HSV;
    using HSB  = Colour::HSB;
  }
  
  // credit SK83RJOSH for their help on this
  struct NormalTangent {
    float CompressedData;
    float f = (CompressedData);

    float xt = CompressedData / 1.0;
    float x = (xt - std::math::floor(xt)) * 2.0 - 1.0 [[export]]; 

    float yt = CompressedData / 256.0;
    float y = (yt - std::math::floor(yt)) * 2.0 - 1.0 [[export]]; 

    float zt = CompressedData / 65535.0;
    float z = (zt - std::math::floor(zt)) * 2.0 - 1.0 [[export]]; 

    float w = std::math::sign(f) [[export]];
  };
}
