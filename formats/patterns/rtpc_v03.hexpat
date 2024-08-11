// Created by EonZeNx
#pragma once

import std.mem;

import rtpc_v01;

#pragma pattern_limit 0x1000000

// Includes magic and version
#pragma magic [ 52 54 50 43 03 ] @ 0x00


namespace Apex {
  
  namespace RtpcV03 {
    using Header  = Apex::RtpcV01::Header;
    using Variant = Apex::RtpcV01::Variant;
    using PropertyHeader  = Apex::RtpcV01::PropertyHeader;
    using Property        = Apex::RtpcV01::Property;
    using ContainerHeader = Apex::RtpcV01::ContainerHeader;
    
    struct Container : ContainerHeader {
      Property  properties[propertyCount] @ offset;
      Container containers[containerCount] @ std::mem::align_to(4, offset + sizeof(PropertyHeader) * propertyCount);
      u32 assignedPropertyCount @ std::mem::align_to(4, offset + sizeof(PropertyHeader) * propertyCount) + sizeof(ContainerHeader) * containerCount;
    };
    
    struct File {
      Header    header;
      Container container;
    };
  }
}

#ifndef IMPORTED
Apex::RtpcV03::File file @ 0x00;
#endif
