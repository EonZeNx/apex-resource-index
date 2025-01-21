// Created by EonZeNx
#pragma once

import std.mem;
import std.sys;
import std.string;

import core.TTypes;
import core.CTypes;
import core.ApexTypes;

#pragma magic [ 01 04 00 ?? ] @ 0x00

namespace Apex {

  namespace Inline {
  
    using Primitive = TTypes::Either<u32, float>;
    using String = std::string::SizedString<u16>;
    using FVec2 = CTypes::FVector2;
    using FVec3 = CTypes::FVector3;
    using FVec4 = CTypes::FVector4;

    using FMat3x3 = CTypes::FMatrix3x3;
    using FMat3x4 = CTypes::FMatrix3x4;
    using FMat4x4 = CTypes::FMatrix4x4;

    using U32Array = CTypes::U32Array;
    using F32Array = CTypes::F32Array;
    using U8Array = CTypes::U8Array;

    enum EVariant : u8 {
      Unassigned =      0x00,
      UInteger32 =      0x01,
      Float32 =         0x02,
      String =          0x03,
      Vector2 =         0x04,
      Vector3 =         0x05,
      Vector4 =         0x06,
      Matrix3X3 =       0x07,
      Matrix3X4 =       0x08,
      UInteger32Array = 0x09,
      Float32Array =    0x0A,
      ByteArray =       0x0B,
      Deprecated =      0x0C,
      ObjectId =        0x0D,
      Events =          0x0E,
      Total =           0x0F
    };

    struct Property {
      u32 name_hash;
      EVariant variant_type;
      
      match(variant_type) {
        (EVariant::Unassigned):      Primitive primitive;
        (EVariant::UInteger32):      Primitive primitive;
        (EVariant::Float32):         Primitive primitive;
        (EVariant::String):          String string;
        (EVariant::Vector2):         FVec2 vector2;
        (EVariant::Vector3):         FVec3 vector3;
        (EVariant::Vector4):         FVec4 vector4;
        (EVariant::Matrix3X3):       FMat3x3 matrix3x3;
        (EVariant::Matrix3X4):       FMat3x4 matrix3x4;
        (EVariant::UInteger32Array): U32Array u32Array;
        (EVariant::Float32Array):    F32Array f32Array;
        (EVariant::ByteArray):       U8Array u8Array;
        (EVariant::ObjectId):        Apex::ObjectId ObjectId;
        (EVariant::Events):          Apex::Events events;
      }
    };

    enum EContainerType : u16 {
      Unk0          = 0x0003,
      Container     = 0x0004,
      Property      = 0x0005
    };

    using Collection;

    struct Container {
      EContainerType type;
      u16 count;
      
      match(type) {
        (EContainerType::Unk0):      Collection containers [count];
        (EContainerType::Container): Collection containers [count];
        (EContainerType::Property):  Property Properties [count];
      }
    };

    struct Collection {
      u32 name_hash;
      u8 count;
      Container containers [count];
    };

    struct Instance {
      u8 count;
      Container containers [count];
       
      if (!std::mem::eof()) {
        u8 property_count; 
        EContainerType property_type;
        String name; 
      } 
    };
  }
}

#ifndef IMPORTED
Apex::Inline::Instance instances [while(!std::mem::eof())] @ 0x00;
#endif
