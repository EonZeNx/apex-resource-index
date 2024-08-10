// Created by EonZeNx
// Apex types
#pragma once

import core.TTypes;

namespace Apex {
  struct ObjectId {
    u16 a [[export]];
    u16 b [[export]];
    u16 c [[export]];
    u16 userData [[export]];
  };
  
  using Event  = TTypes::Pair<u32, u32>;
  using Events = TTypes::Array<u32, Apex::Event>;
}
