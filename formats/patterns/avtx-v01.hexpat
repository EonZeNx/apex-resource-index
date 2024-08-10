// Created by Brooen, EonZeNx

#pragma array_limit 100000000
#pragma pattern_limit 100000000

#pragma magic [ 41 56 54 58 ] @ 0x00

#define MAX_STREAMS 8

bitfield TextureFlags {
  STREAMED        : 1;
  PLACEMENT       : 1;
  TILED           : 1;
  SRGB            : 1;
  LOD_FROM_RENDER : 2;
  CUBE            : 1;
  WATCH           : 1;
};

struct AvtxHeader {
  char Magic [4];
  u8   Version;
  u8   Platform;
  u8   Tag;
  u8   Dimension;
  u32  Format;
  u16  Width;
  u16  Height;
  u16  Depth;
  
  u16 Flags [[no_unique_address]];
  TextureFlags FlagType;
  padding [1];
  
  u8  Mips;
  u8  MipsRedisent;
  u8  MipsCinematic;
  u8  MipsBias;
  u8  LodGroup;
  u8  Pool;
  u8  Reserved0 [2];
  u32 Reserved1;
};

struct AvtxStream {
  u32  Offset;
  u32  Size;
  u16  Alignment;
  bool TileMode;
  u8   Source;
  
  if (Offset != 0) {
    u8 Data [Size] @ Offset;
  }
};

struct AvtxFile {
  AvtxHeader Header;
  AvtxStream Streams [MAX_STREAMS];
};

AvtxFile file @ 0x00;