// Created by EonZeNx
#pragma once

import std.string;

#pragma array_limit 0x1000000
#pragma pattern_limit 0x1000000

// Includes magic and version
#pragma magic [ 41 41 46 00 01 ] @ 0x00


namespace Apex {
  
  namespace AafV01 {
	  
	struct Header {
      char magic [4];
      u32  version;
      char comment [28];
      u32  totalUnpackedSize;
      u32  requiredUnpackBufferSize;
      u32  chunkCount;
    };

    struct ChunkHeader {
      u32 compressedSize;
      u32 decompressedSize;
      u32 chunkSize;
      u32 magic;
    };
	
	struct Chunk : ChunkHeader {
      u8 data [compressedSize];
      
      $ += (chunkSize - compressedSize - sizeof(ChunkHeader));
    };
	
	struct File {
      Header header;
      Chunk  chunks [header.chunkCount];
    };
  }
}


Apex::AafV01::File file @ 0x00;
