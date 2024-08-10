// Created by EonZeNx
#pragma once

import std.mem;
import std.sys;
import std.string;

import core.TTypes;
import core.CTypes;
import core.ApexTypes;

// Includes magic and version
#pragma magic [ 52 54 50 43 01 ] @ 0x00

using Primitive = TTypes::Either<u32, float>;
using FVec2 = CTypes::FVector2;
using FVec3 = CTypes::FVector3;
using FVec4 = CTypes::FVector4;
using FMat3x3 = CTypes::FMatrix3x3;
using FMat3x4 = CTypes::FMatrix3x4;
using FMat4x4 = CTypes::FMatrix4x4;


struct RtpcV01Header {
  char Magic [4];
  u32  Version;
};

enum RtpcV01Variant : u8 {
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

struct RtpcV01PropertyHeader {
  u32 NameHash;
  Primitive Data;
  RtpcV01Variant VariantType;
};

struct RtpcV01Property : RtpcV01PropertyHeader {
  if (VariantType == RtpcV01Variant::String) {
    std::string::NullString String @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::Vector2) {
    FVec2 Vector2 @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::Vector3) {
    FVec3 Vector3 @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::Vector4) {
    FVec4 Vector4 @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::Matrix3X3) {
    FMat3x3 Matrix3x3 @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::Matrix4X4) {
    FMat4x4 Matrix4x4 @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::UInteger32Array) {
    TTypes::Array<u32, u32> U32Array @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::Float32Array) {
    TTypes::Array<u32, float> F32Array @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::ByteArray) {
    TTypes::Array<u32, u8> U8Array @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::ObjectId) {
    Apex::ObjectId ObjectId @ Data.a;
  }
  
  if (VariantType == RtpcV01Variant::Events) {
    TTypes::Array<u32, Apex::Event> Events @ Data.a;
  }
};

struct RtpcV01ContainerHeader {
  u32 NameHash;
  u32 Offset;
  u16 PropertyCount;
  u16 ContainerCount;
};

struct RtpcV01Container : RtpcV01ContainerHeader {
  RtpcV01Property  properties[PropertyCount] @ Offset;
  RtpcV01Container containers[ContainerCount] @ std::mem::align_to(4, Offset + sizeof(RtpcV01PropertyHeader) * PropertyCount);
};


struct RtpcV01File {
  RtpcV01Header Header;
  RtpcV01Container Container;
};

RtpcV01File File @ 0x00;