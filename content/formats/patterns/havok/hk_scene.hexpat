// Created by Brooen, EonZeNx

import std.core;
import std.string;

import core.PTypes;

// Includes magic and version
#pragma magic [ 57 E0 E0 57 10 C0 C0 10 00 00 00 00 ] @ 0x00

using NullString = PTypes::NullString;


enum HkType : u8 {
  Unknown,
  None,
  
  Void,
  Bool,
  Char,
  S8,
  U8,
  S16,
  U16,
  S32,
  U32,
  U64,
  S64,
  Real,
  ULong,
  Half,
  
  Matrix3,
  Matrix4,
  Vector4,
  Transform,
  QsTransform,
  Quaternion,
  
  Enum,
  Flags,
  ArraySimple,
  Array,
  ArrayRel,
  
  Pointer,
  PointerFunction,
  
  CString,
  StringPointer,
  
  Struct,
};

enum HkFlags : u8 {
  Unknown,
  None,
  NotOwned,
  Align8,
  Align16,
  SerialiseIgnore
};

struct HkMember {
  NullString name;
  u64 offset;
  HkType vType;
  HkType vSubType;
  NullString className;
  u32 arrayLength;
  HkFlags flags;
};

struct HkDescriptor {
  NullString name;
  u64 uuid;
  HkMember members [];
};

struct HkObject {
  NullString name;
  HkDescriptor descriptor;
  HkMember members [];
};

struct HkHeader {
  char magic [12];
  u32  version;
  char extras0 [4];
  char constants0 [20];
  char versionName[14];
  char constants1 [6];
  char extras1 [2];
  char pad0 [2];
};

struct HkSection {
  char sectionName [16];
  char constants0 [4];
  u32  offset;
  u32  data1Offset;
  u32  data2Offset;
  u32  data3Offset;
  u32  data4Offset;
  u32  data5Offset;
  u32  dataEndOffset;
  char pad0 [16];
};

struct HkSectionDataView {
  u32 sectionOffset;
  u32 sectionDataOffset;
};

struct HkClassName {
  u32 uuid;
  u8  unk1;
  NullString name;
};

fn uncompress_u64(ref auto val) {
  u32 length = std::core::member_count(val);
  u64 accu = 1;
  u64 result = 0;
  
  for (u8 i = 0, i < length, i = i + 1) {
    result += u64(val[i] & 0xFF) * accu;
    accu *= 256;
  }
  
  return result;
};

struct HkData1 {
  u8 compStartOffset [4]; // compressed u64(u32)
  u64 startOffset = uncompress_u64(compStartOffset) [[export]];
  
  u8 compEndOffset [4]; // compressed u64(u32)
  u64 endOffset = uncompress_u64(compEndOffset) [[export]];
};

struct HkData2 {
  u8 compStartOffset [4]; // compressed u64(u32)
  u64 startOffset = uncompress_u64(compStartOffset) [[export]];
  
  u8 compSectionIndex [4];// u32(compressed u64(u32))
  u32 sectionIndex = u32(uncompress_u64(compSectionIndex)) [[export]];
  
  u8 compEndOffset [4]; // compressed u64(u32)
  u64 endOffset = uncompress_u64(compEndOffset) [[export]];
};

struct HkData3 {
  u8 compStartOffset [4]; // compressed u64(u32)
  u64 startOffset = uncompress_u64(compStartOffset) [[export]];
  
  u8 compSectionIndex [4];// u32(compressed u64(u32))
  u32 sectionIndex = u32(uncompress_u64(compSectionIndex)) [[export]];
  
  u8 compEndOffset [4]; // compressed u64(u32)
  u64 endOffset = uncompress_u64(compEndOffset) [[export]];
};


struct HkFile {
  HkHeader header;
  HkSection classNamesSection;
  HkSection typesSection;
  HkSection dataSection;
  
  $ = classNamesSection.offset;
  HkClassName classNames [while($ + sizeof(HkClassName) < classNamesSection.offset + classNamesSection.dataEndOffset)];
  
  $ = dataSection.offset + dataSection.data1Offset;
  // HkData1 = 8
  HkData1 data1Array [while($ + 8 <= dataSection.offset + dataSection.data2Offset)];
  
  $ = dataSection.offset + dataSection.data2Offset;
  // HkData2 = 12
  HkData2 data2Array [while($ + 12 <= dataSection.offset + dataSection.data3Offset)];
  
  $ = dataSection.offset + dataSection.data3Offset;
  // HkData3 = 12
  HkData3 data3Array [while($ + 12 <= dataSection.offset + dataSection.dataEndOffset)];
};



HkFile file @ 0x00;