// Created by Brooen, EonZeNx
#pragma once

import std.string;

// Extras > Settings > Folders > Add > MY_FOLDER > Confirm
// Should look like: MY_FOLDER/patterns/*.hexpat
import TTypes;
import CTypes;

#pragma array_limit 10000000000000000
#pragma pattern_limit 10000000000000000

#pragma magic [ 52 42 4D 44 4C ] @ 0x04

using FVec2 = CTypes::FVector2;
using FVec3 = CTypes::FVector3;
using FVec4 = CTypes::FVector4;

using NVec = CTypes::NormalTangent;
using DVec = TTypes::Vector4<u16>;
using TVec = CTypes::NormalTangent;
using BVec = TTypes::Vector4<u8>;

using RbmBox = CTypes::FBoxR;

using Filepath = std::string::SizedString<u32>;


struct Header {
  u32    MagicLength;
  char   Magic[5];
  u32    VersionMajor;
  u32    VersionMinor;
  u32    Revision;
  RbmBox BoundingBox;
  u32    RenderBlockCount;
  u32    Tag;
};

struct MaterialCarPaint {
  FVec4 m_SpecularGloss;
  FVec4 m_Metallic;
  FVec4 m_ClearCoat;
  FVec4 m_Emissive;
  FVec4 m_DiffuseWrap;
  FVec4 m_DirtParams;
  FVec4 m_DirtBlend;
  FVec4 m_DirtColor;
  FVec4 m_DecalCount;
  FVec4 m_DecalWidth;
  FVec4 m_Decal1Color;
  FVec4 m_Decal2Color;
  FVec4 m_Decal3Color;
  FVec4 m_Decal4Color;
  FVec4 m_DecalBlend;
  FVec4 m_Damage;
  FVec4 m_DamageBlend;
  FVec4 m_DamageColor;
  
  float SupportDecals;
  float SupportDmgBlend;
  float SupportLayered;
  float SupportOverlay;
  float SupportRotating;
  float SupportDirt;
  float SupportSoftTint;
  
  FVec4 m_TintColorR;
  FVec4 m_TintColorG;
  FVec4 m_TintColorB;
  
  float _unused [4];
  float m_SpecularGlossOverride;
  float m_MetallicOverride;
  float m_ClearCoatOverride;
};

struct MaterialBavarium {
  float Color_Alpha;
  float Time;
  float EmissiveScale;
  float AdditionalAlpha;
};
    
struct MaterialWindow {
  float m_SpecularGloss;
  float m_SpecularFresnel;
  float m_DiffuseRoughness;
  float m_TintPower;
  float m_MinAlpha;
  float m_UVScale;
  float m_unkown [4];
};
    
struct MaterialCarLight {
  padding [4];
  float         m_SpecularGloss;
  float         m_reflectivity;
  padding [16];
  float         m_SpecularFresnel;
  
  FVec4 m_DiffuseModulator;
  FVec2 tiling;
  padding [1028]; // could be control point remap table?
};

struct MaterialGeneralMk3 {
    float NormalStrength;
    float Reflectivity_1;
    float Roughness_1;
    float DiffuseWrap_1;
    float Emissive_1;
    float Transmission_1;
    float ClearCoat_1;
    float Roughness_2;
    float DiffuseWrap_2;
    float Emissive_2;
    float Transmission_2;
    float Reflectivity_2;
    float ClearCoat_2;
    float Roughness_3;
    float DiffuseWrap_3;
    float Emissive_3;
    float Transmission_3;
    float Reflectivity_3;
    float ClearCoat_3;
    float Roughness_4;
    float DiffuseWrap_4;
    float Emissive_4;
    float Transmission_4;
    float Reflectivity_4;
    float ClearCoat_4;
    float LayeredHeightMapUVScale;
    float LayeredUVScale;
    float LayeredHeight1Influence;
    float LayeredHeight2Influence;
    float LayeredHeightMapInfluence;
    float LayeredMaskInfluence;
    float LayeredShift;
    float LayeredRoughness;
    float LayeredDiffuseWrap;
    float LayeredEmissive;
    float LayeredTransmission;
    float LayeredReflectivity;
    float LayeredClearCoat;
    float DecalBlend;
    float DecalBlendNormal;
    float DecalReflectivity;
    float DecalRoughness;
    float DecalDiffuseWrap;
    float DecalEmissive;
    float DecalTransmission;
    float DecalClearCoat;
    float OverlayHeightInfluence;
    float OverlayHeightMapInfluence;
    float OverlayMaskInfluence;
    float OverlayShift;
    float OverlayColorR;
    float OverlayColorG;
    float OverlayColorB;
    float OverlayBrightness;
    float OverlayGloss;
    float OverlayMetallic;
    float OverlayReflectivity;
    float OverlayRoughness;
    float OverlayDiffuseWrap;
    float OverlayEmissive;
    float OverlayTransmission;
    float OverlayClearCoat;
    float DamageReflectivity;
    float DamageRoughness;
    float DamageDiffuseWrap;
    float DamageEmissive;
    float DamageTransmission;
    float DamageHeightInfluence;
    float DamageMaskInfluence;
    float DamageClearCoat;
};

struct MeshDeform {
  FVec3 Position;
  
  NVec nVec;
  DVec dVec;
};

struct Remap {
 u16 RemapPoint;
};


struct RbmMesh2 {
  FVec3 Position;
  FVec2 UV;
  
  NVec nVec;
  TVec tVec;
};

struct RbmMesh3 {
  FVec3 Position;
  FVec2 UV1;
  FVec2 UV2;
  
  NVec nVec;
  TVec tVec;
  
  u32 Color;
};

struct RbmMesh4 {
  TTypes::Vector3<u16> Position;
  
  u16 BoneIndexorUnspecified;
  
  if (parent.FlagType.IS_SKINNED) {    
  u32 BoneWeight;
    u32 BoneIndex;
  }  
};

struct RbmMesh5 {
  TTypes::Vector3<u16> Position;
  
  u16 Unspecified;
  BVec bVec[2];
  u16 U1;
  u16 V1;
  TVec tVec;
};

struct RbmMeshData {
  FVec2 UV1;
  FVec2 UV2;
  
  NVec nVec;
  TVec tVec;
};

struct RbmMeshDataDeform {
  FVec2 UV1;
  FVec2 UV2;
  
  NVec nVec;
  TVec tVec;
  
  u64 DeformDataMaybe;
};

struct RbmMeshData2 {
  FVec2 UV1;
  FVec2 UV2;
  
  NVec nVec;
  TVec tVec;
  
  float Color;
};

struct RbmMeshData3 {
  u32 UV1;
  u32 UV2;
  
  NVec nVec;
  TVec tVec;
  
  float Color;
};

enum RbmType : u32 {
  // VegetationFoliage = 0x3d79884c6,
  // FoliageBark = 0xb1f9133d,
  // GeneralSimple = 0x2ee0f4a9,
  WaterHull = 0xf99c72a1,
  // SimpleGeometry = 0x90fe086c,
  BavariumShield = 0xa5d24ccd,
  Window = 0x5b2003f6,
  // Layered = 0xc7021ee3,
  // Landmark = 0x3b630e6d,
  GeneralMK3 = 0x2cec5ad5,
  // General6 = 0xa7583b2b,
  CarLight = 0xdb948bf1,
  CarPaint14 = 0x483304d6,
  // General3 = 0x04894ecd,
  // Character9 = 0x9d6e332a,
  Character6 = 0x626f5e3b,
  // Road = 0x566dce92,
  // GeneralSimple3 = 0x35bf53d5,
};

bitfield CarPaintFlagType {
  SUPPORT_DECALS             : 1;
  SUPPORT_DAMAGE_BLEND       : 1;
  SUPPORT_DIRT               : 1;
  SUPPORT_PALETTE            : 1;
  SUPPORT_SOFT_TINT          : 1;
  SUPPORT_LAYERED            : 1;
  SUPPORT_OVERLAY            : 1;
  DISABLE_BACKFACE_CULLING   : 1;
  TRANSPARENCY_ALPHABLENDING : 1;
  TRANSPARENCY_ALPHATESTING  : 1;
  TRANSPARENCY_UNUSED        : 2;  
  IS_DEFORM                  : 1;
  IS_SKINNED                 : 1;
};

bitfield GeneralMk3FlagType {
  BACKFACE_CULLING           : 1;
  TRANSPARENCY_ALPHABLENDING : 1;
  TRANSPARENCY_ALPHATESTING  : 1;
  DYNAMIC_EMISSIVE           : 1;
  WORLD_SPACE_NORMALS        : 1;
  IS_SKINNED                 : 1;
  UNKNOWN                    : 1;
  USE_LAYERED                : 1;
  USE_OVERLAY                : 1;
  USE_DECAL                  : 1;
  USE_DAMAGE                 : 4;     
  ANISOTROPIC_FILTERING      : 1;
  DESTRUCTION                : 1;
};

struct ControlPointRemap {
  u32 controlpointremaptest[[no_unique_address]];
  
  if (controlpointremaptest != 0) {
    u32 ControlPoint[256];
  }
  
  if (controlpointremaptest == 0) {
    padding [1024];
  }
};

struct RbmUV3 {
  FVec2 UV3;
};
 
struct RbmFace {
  u16 one;
  u16 two;
  u16 three;
};

struct RbmModelDataCarPaint14 {
  padding [1];
  
  u32 Flag[[no_unique_address]];
  CarPaintFlagType FlagType;
  
  padding [6];
  MaterialCarPaint MaterialData;
  ControlPointRemap ControlPointRemapTable;
  u32 FilePathSlotCount;
  Filepath Filepaths [FilePathSlotCount];
  padding [16];
  u32 VertCount;
  
  if (FlagType.IS_DEFORM) {
    MeshDeform Vertices [VertCount];
  }
  if (FlagType.IS_DEFORM == false) {
    FVec3 Vertices [VertCount];
  }  
  
  u32 VertCount2;
  
  if (FlagType.IS_DEFORM) {
    RbmMeshDataDeform MeshData [VertCount2];
  }
  
  if (FlagType.IS_DEFORM  == false) {
    RbmMeshData MeshData [VertCount2];
  }
  
  if (FlagType.SUPPORT_LAYERED) {
    u32 UV3Count;
    RbmUV3 UV3 [UV3Count];
  }
  else if (FlagType.SUPPORT_OVERLAY) {
    u32 UV3Count;
    RbmUV3 UV3 [UV3Count];
  }
  
  u32 FaceCount;
  RbmFace FaceIndicies [FaceCount/3];
  u32 endstring;
};

struct RbmModelDataBavariumShield {
  padding [1];
  MaterialBavarium MaterialData;
  u32 FilePathSlotCount;
  Filepath Filepaths [FilePathSlotCount];
  padding [16];
  u32 VertCount;
  RbmMesh2 Mesh [VertCount];
  u32 FaceCount;
  RbmFace FaceIndicies [FaceCount/3];
  u32 endstring;  
};

struct RbmModelDataWaterHull {
  padding [21];
  u32 VertCount;
  FVec3 Vertices [VertCount];
  u32 FaceCount;
  RbmFace FaceIndicies [FaceCount/3];
  u32 endstring; 
};

struct RbmModelDataWindow {
  padding [1];
  MaterialWindow MaterialData;
  u32 FilePathSlotCount;
  Filepath Filepaths [FilePathSlotCount];
  padding [16];
  u32 VertCount;
  RbmMesh3 Mesh [VertCount];    
  u32 FaceCount;
  RbmFace FaceIndicies [FaceCount/3];
  u32 endstring;
};

struct RbmModelDataCarLight {
  padding [1];
  MaterialCarLight MaterialData;
  u32 FilePathSlotCount;
  Filepath Filepaths [FilePathSlotCount];
  padding [16];
  u32 VertCount;
  FVec3 Vertices [VertCount];
  u32 VertCount2;
  RbmMeshData MeshData [VertCount2];
  u32 FaceCount;
  RbmFace FaceIndicies [FaceCount/3];
  u32 endstring;
};

struct RbmModelDataGeneralMk3 {
  padding [73];
  u32 Flag[[no_unique_address]];
  GeneralMk3FlagType FlagType;
  padding [30];
  MaterialGeneralMk3 MaterialData;
  u32 FilePathSlotCount;
  Filepath Filepaths [FilePathSlotCount];
  padding [16];   
  u32 VertCount;
  RbmMesh4 Vertices [VertCount];
  u32 VertCount2;
  RbmMeshData3 MeshData [VertCount2];
  if (FlagType.DESTRUCTION) {
      padding[4];
      u32 FaceCount;
      padding[4];
      u32 RemapCount;
      Remap Remaps [RemapCount];
  }
  u32 FaceCount;
  RbmFace FaceIndicies [FaceCount/3];
  u32 endstring;
};

struct RbmModelDataCharacter6 {
  padding [57];
  // u32 Flag[[no_unique_address]];
  // RbmFlagType FlagType;
  // character6material MaterialData;
  u32 FilePathSlotCount;
  Filepath Filepaths [FilePathSlotCount];
  padding [16];   
  u32 VertCount;
  RbmMesh5 Vertices [VertCount];
  padding[4];
  u32 FaceCount;
  RbmFace FaceIndicies [FaceCount/3];
  padding[54];
  u32 endstring;
};

struct RbmModel {
  RbmType RenderBlockType;
    
  if (RenderBlockType == RbmType::CarPaint14) {
    RbmModelDataCarPaint14 CarPaint14;  
  }
    
  if (RenderBlockType == RbmType::BavariumShield) {
    RbmModelDataBavariumShield BavariumShield;
  }
    
  if (RenderBlockType == RbmType::WaterHull) {
    RbmModelDataWaterHull WaterHull;
  }
  
  if (RenderBlockType == RbmType::Window) {
    RbmModelDataWindow Window;
  }
  
  if (RenderBlockType == RbmType::CarLight) {
    RbmModelDataCarLight CarLight;
  }
    
  if (RenderBlockType == RbmType::GeneralMK3) {
    RbmModelDataGeneralMk3 GeneralMk3;
  }
  if (RenderBlockType == RbmType::Character6) {
  RbmModelDataCharacter6 Character6;
  }
};

struct RbmFile
{
  Header Header;
  RbmModel RenderBlocks [Header.RenderBlockCount];
  ///RbmModel array [1];
   
};

RbmFile File @ 0x00;
