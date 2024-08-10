// Created by EonZeNx
#pragma once

import std.mem;
import std.string;

// Includes magic and version
#pragma magic [ 04 00 00 00 53 41 52 43 02 ] @ 0x00


struct SarcV02Header {
  u32  MagicLength;
  char Magic [4];
  u32  Version;
  u32  Size;
};

struct SarcV02Entry {
  std::string::SizedString<u32> FilePath;
  u32 DataOffset;
  u32 Size;
  
  // DataOffset of 0 == reference
  if (DataOffset > 0) {
    char Data [Size] @ DataOffset;
  }
};

struct SarcV02File {
  SarcV02Header Header;
  SarcV02Entry Entries [while(Header.Size - $ > sizeof(SarcV02Header))];
};

SarcV02File File @ 0x00;