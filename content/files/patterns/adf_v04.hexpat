// Created by EonZeNx
#pragma once

// Includes magic and version
#pragma magic [ 20 46 44 41 04 ] @ 0x00

import std.mem;
import std.sys;
import std.string;
import type.base;

namespace Apex {
  
  namespace AdfV04 {
    
    using NullString = std::string::NullString;
    using SizedString = std::string::SizedString<u8>;
    
    enum EType : u32 {
      Scalar =      0x00,
      Struct =      0x01,
      Pointer =     0x02,
      Array =       0x03,
      InlineArray = 0x04,
      String =      0x05,
      Recursive =   0x06,
      Bitfield =    0x07,
      Enum =        0x08,
      StringHash =  0x09,
      Deferred =    0x0A,
    };
    
    enum EScalarType : u16 {
      Signed =   0x00,
      Unsigned = 0x01,
      Float =    0x02,
    };
      
    struct Header {
      char magic [4];
      type::Hex<u32> version;
      u32 instance_count;
      type::Hex<u32> instance_offset;
      u32 type_count;
      type::Hex<u32> type_offset;
      u32 string_hash_count;
      type::Hex<u32> string_hash_offset;
      u32 string_table_count;
      type::Hex<u32> string_table_offset;
      u32 file_size;
      u32 metadata_offset;
      u32 header_flags;
      u32 included_libraries;
      u32 unk_01, unk_02;
      NullString comment;
    };
    
    struct StringHashEntry {
      NullString value;
      u64 hash;
    };
    
    struct Member {
      u64 name_index;
      u32 type_hash;
      u32 alignment;
      u32 offset_and_bit_offset;
      u32 flags;
      u64 default_value;
    };
    
    struct Enum {
      u64 name_index;
      u32 value;
    };
    
    struct Type {
      EType type;
      u32 size;
      u32 alignment;
      u32 type_hash;
      u64 name_index;
      u16 flags;
      EScalarType scalar_type;
      u32 scalar_type_hash;
      u32 bit_count_or_array_length;
      u32 member_count_or_data_align;
      
      match(type) {
        (EType::Struct): Member members [member_count_or_data_align];
        (EType::Enum):   Enum enum_values [member_count_or_data_align];
      }
    };
    
    struct File {
      Header header;
      
      if (header.string_hash_offset > 0) {
        StringHashEntry string_hashes [header.string_hash_count] @ header.string_hash_offset;
      }
      
      if (header.string_table_offset > 0) {
        u8 string_table_lengths [header.string_table_count] @ header.string_table_offset;
        NullString string_table [header.string_table_count] @ header.string_table_offset + header.string_table_count;
      }
      
      Type types [header.type_count] @ header.type_offset;
    };
  }
}

#ifndef IMPORTED
Apex::AdfV04::File file @ 0x00;
#endif
