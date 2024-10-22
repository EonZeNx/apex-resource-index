// Created by EonZeNx
#pragma once

import std.mem;
import std.sys;
import std.string;

import core.TTypes;
import core.CTypes;
import core.PTypes;
import core.ApexTypes;

// Includes magic and version
#pragma magic [ 52 54 50 43 01 ] @ 0x00


namespace Apex {
  
  namespace RtpcV01 {
    
    using Primitive = TTypes::Either<u32, float>;
    using FVec2 = CTypes::FVector2;
    using FVec3 = CTypes::FVector3;
    using FVec4 = CTypes::FVector4;
	
    using FMat3x3 = CTypes::FMatrix3x3;
    using FMat3x4 = CTypes::FMatrix3x4;
    using FMat4x4 = CTypes::FMatrix4x4;
	
    using U32Array = CTypes::U32Array;
    using F32Array = CTypes::F32Array;
    using U8Array = CTypes::U8Array;
	
    using NullString = PTypes::NullString;
    
    
    struct Header {
      char magic [4];
      u32  version;
    };
    
    enum Variant : u8 {
      Unassigned =      0x00, // No pad
      UInteger32 =      0x01, // No pad
      Float32 =         0x02, // No pad
      String =          0x03, // No pad
      Vector2 =         0x04, // 4-byte pad
      Vector3 =         0x05, // 4-byte pad
      Vector4 =         0x06, // 4-byte pad
      Matrix3X3 =       0x07, // 4-byte pad
      Matrix4X4 =       0x08, // 16-byte pad
      UInteger32Array = 0x09, // 4-byte pad
      Float32Array =    0x0A, // 4-byte pad
      ByteArray =       0x0B, // 16-byte pad
      Deprecated =      0x0C, // 4-byte pad
      ObjectId =        0x0D, // 4-byte pad
      Events =          0x0E, // 4-byte pad
      Total =           0x0F
    };
    
    struct PropertyHeader {
      u32 nameHash;
      Primitive data;
      Variant variantType;
    };
    
    struct Property : PropertyHeader {
      if (variantType == Variant::String) {
        NullString string @ data.a;
      }
      
      if (variantType == Variant::Vector2) {
        FVec2 vector2 @ data.a;
      }
      
      if (variantType == Variant::Vector3) {
        FVec3 vector3 @ data.a;
      }
      
      if (variantType == Variant::Vector4) {
        FVec4 vector4 @ data.a;
      }
      
      if (variantType == Variant::Matrix3X3) {
        FMat3x3 matrix3x3 @ data.a;
      }
      
      if (variantType == Variant::Matrix4X4) {
        FMat4x4 matrix4x4 @ data.a;
      }
      
      if (variantType == Variant::UInteger32Array) {
        U32Array u32Array @ data.a;
      }
      
      if (variantType == Variant::Float32Array) {
        F32Array f32Array @ data.a;
      }
      
      if (variantType == Variant::ByteArray) {
        U8Array u8Array @ data.a;
      }
      
      if (variantType == Variant::ObjectId) {
        Apex::ObjectId ObjectId @ data.a;
      }
      
      if (variantType == Variant::Events) {
        Apex::Events events @ data.a;
      }
    };
    
    struct ContainerHeader {
      u32 nameHash;
      u32 offset;
      u16 propertyCount;
      u16 containerCount;
    };
    
    struct Container : ContainerHeader {
      Property  properties[propertyCount] @ offset;
      Container containers[containerCount] @ std::mem::align_to(4, offset + sizeof(PropertyHeader) * propertyCount);
    };
    
    
    struct File {
      Header    header;
      Container container;
    };
  }
}

#ifndef IMPORTED
Apex::RtpcV01::File file @ 0x00;
#endif
