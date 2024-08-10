// Created by EonZeNx
#pragma once

import std.string;

#pragma array_limit 0x1000000
#pragma pattern_limit 0x1000000

// Includes magic and version
#pragma magic [ 41 41 46 00 01 ] @ 0x00


struct AafV01Header {
  char Magic [4];
  u32  Version;
  char Comment [28];
  u32  TotalUnpackedSize;
  u32  RequiredUnpackBufferSize;
  u32  ChunkCount;
};

struct AafV01ChunkHeader {
  u32 CompressedSize;
  u32 DecompressedSize;
  u32 ChunkSize;
  u32 Magic;
};

struct AafV01Chunk : AafV01ChunkHeader {
  u8 Data [CompressedSize];
  
  $ += (ChunkSize - CompressedSize - sizeof(AafV01ChunkHeader));
};

struct AafV01File {
  AafV01Header Header;
  AafV01Chunk  Chunks [Header.ChunkCount];
};

AafV01File File @ 0x00;