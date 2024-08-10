// Created by Brooen, EonZeNx

import std.string;

import core.TTypes;
import core.CTypes;

#pragma magic [ 50 46 49 ] @ 0x00

using FMat3x4 = CTypes::FMatrix3x4;
using FMat4x4 = CTypes::FMatrix4x4;

struct PfiV01Instance
{
  u32 Hash;
  std::string::SizedString<u32> FilePath;
  FMat4x4 Matrix;
};

struct PfiV01Header {
  u32 Magic;
  u32 Version;
  u32 unk;
  u32 NumInstances;
  FMat4x4 Matrix;
};

struct PfiV01File
{
  PfiV01Header Header;
  
  // Padding?
  FMat3x4 Unknown;
  
  PfiV01Instance Instances [Header.NumInstances];
};

PfiV01File File @ 0x00;