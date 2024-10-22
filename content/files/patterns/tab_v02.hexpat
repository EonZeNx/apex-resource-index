// Created by EonZeNx
#pragma once

import std.mem;

// Includes magic and version
#pragma magic [ 54 41 42 00 02 ] @ 0x00


struct TabV02Header {
  char Magic [4];
  u16  MajorVersion;
  u16  MinorVersion;
  s32  Alignment;
};

struct TabV02Entry {
  u32 NameHash;
  u32 Offset;
  u32 Size;
};

struct TabV02File {
  TabV02Header Header;
  TabV02Entry Entries [while(!std::mem::eof())];
};

TabV02File File @ 0x00;