// Created by Brooen

struct VegcHeader {
  u32 Version;
  u32 Unk0;
  u32 InstanceCount;
};

struct VegcData {
  float Data [5]; // i got no clue
};

struct VegcFile {
  VegcHeader Header;
  VegcData   Data [Header.InstanceCount];
};

VegcFile File @ 0x00;