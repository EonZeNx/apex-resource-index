// Created by EonZeNx
// Apex math
#pragma once

import core.TTypes;

namespace apex {

  namespace math {
    
	const float Pi = 3.141592741012f;
	
	struct constants {
	  const float Pi = 3.141592741012f;
	};
    
    fn AlmostEqual(float a, float b, float delta = 0.00001f) {
      return std::math::abs(a - b) < delta;
    };
    
    fn RadiansToDegrees(float radians) {
      return (radians * 180.f) / Pi;
    };
    
    fn DegreesToRadians(float d) {
      float r = (d * Pi) / 180.f;
      return r;
    };
  }
}
