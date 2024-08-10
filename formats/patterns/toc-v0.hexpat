// Created by EonZeNx
#pragma once

import std.mem;
import std.string;

struct TocEntry {
  std::string::SizedString<u32> FilePath;
  u32 DataOffset;
  u32 Size;
};

struct TocFile {
  TocEntry Entries [while(!std::mem::eof())];
};

TocFile File @ 0x00;