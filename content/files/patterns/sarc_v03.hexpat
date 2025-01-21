// Created by EonZeNx
#pragma once

// Includes magic and version
#pragma magic [ 04 00 00 00 53 41 52 43 03 ] @ 0x00

import std.mem;
import std.core;
import std.string;
import type.base;

namespace Apex {
  
  namespace SarcV03 {
    
    using NullString = std::string::NullString;
    
    struct Header {
      u32  magic_length;
      char magic [4];
      u32  version;
      type::Hex<u32> entry_size;
      type::Hex<u32> path_array_size;
    };
    
    struct Entry {
      type::Hex<u32> path_offset;
      type::Hex<u32> data_offset;
      type::Hex<u32> size;
      type::Hex<u32> unk [2];
    };
    
    struct DataEntry : Entry {
      NullString path @ sizeof(Header) + path_offset;
      bool local_data = (data_offset != 0 && size != 0);
      
      if (local_data) {
        char data [size] @ data_offset;
      }
    };
    
    struct File {
      Header header;
      $ = sizeof(Header) + header.path_array_size;
      DataEntry entries [while($ + sizeof(Entry) < sizeof(Header) + header.entry_size)];
    };
  }
}


#ifndef IMPORTED
Apex::SarcV03::File file @ 0x00;
#endif