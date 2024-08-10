// Created by EonZeNx
#pragma once

import std.mem;
import std.sys;
import std.string;

import core.TTypes;
import core.CTypes;
import core.ApexTypes;

#pragma magic [ 01 04 00 ?? ] @ 0x00

using FVec2 = CTypes::FVector2;
using FVec3 = CTypes::FVector3;
using FVec4 = CTypes::FVector4;
using FMat3x3 = CTypes::FMatrix3x3;
using FMat3x4 = CTypes::FMatrix3x4;
using FMat4x4 = CTypes::FMatrix4x4;


struct RtpcV0104Header {
  u8  MajorVersion;
  u16 MinorVersion;
  u16 ContainerCount;
};

enum RtpcV0104Variant : u8 {
  Unassigned = 0x0,
  Integer32  = 0x1,
  Float32    = 0x2,
  String     = 0x3,
  Vector2    = 0x4,
  Vector3    = 0x5,
  Vector4    = 0x6,
  DoNotUse01 = 0x7,
  Matrix3X4  = 0x8,
  Events     = 0xE
};

struct RtpcV0104Property {
  u32 NameHash;
  RtpcV0104Variant VariantType;
  
  if (VariantType == RtpcV0104Variant::Integer32) {
    s32 S32;
  }
  
  if (VariantType == RtpcV0104Variant::Float32) {
    float F32;
  }
  
  if (VariantType == RtpcV0104Variant::String) {
    std::string::SizedString<u16> String;
  }
  
  if (VariantType == RtpcV0104Variant::Vector2) {
    FVec2 Vector2;
  }
  
  if (VariantType == RtpcV0104Variant::Vector3) {
    FVec3 Vector3;
  }
  
  if (VariantType == RtpcV0104Variant::Vector4) {
    FVec2 Vector4;
  }
  
  if (VariantType == RtpcV0104Variant::DoNotUse01) {
    FMat3x3 Matrix3x3;
  }
  
  if (VariantType == RtpcV0104Variant::Matrix3X4) {
    FMat3x4 Matrix3x4;
  }
  
  if (VariantType == RtpcV0104Variant::Events) {
    TTypes::Array<u32, Apex::Event> Events;
  }
};

struct RtpcV0104Container {
  u32 NameHash;
  u8  MajorVersion;
  u16 MinorVersion;
  u16 PropertyCount;
  
  RtpcV0104Property Properties [PropertyCount];
};


struct RtpcV0104File {
  RtpcV0104Header    Header;
  RtpcV0104Container Container [Header.ContainerCount];
};

RtpcV0104File File @ 0x00;