// Created by EonZeNx
#pragma once

import std.math;
import std.io;

import core.TTypes;
import core.CTypes;
import core.ApexTypes;
import apex.math;

using FVec3 = CTypes::FVector3;
using FMat3x3 = CTypes::FMatrix3x3;
using FMat4x3 = CTypes::FMatrix4x3;

fn GameToEulerA(ref FMat4x3 gameMat) {
  FVec3 psiThetaPhi;
  
  const float theta = -std::math::asin(gameMat.c.x);
  const float cosTheta = std::math::cos(theta);
  
  psiThetaPhi.x = std::math::atan2(gameMat.c.y / cosTheta, gameMat.c.z / cosTheta);
  psiThetaPhi.y = theta;
  psiThetaPhi.z = std::math::atan2(gameMat.b.x / cosTheta, gameMat.a.x / cosTheta);
  
  return psiThetaPhi;
};

fn GameToEulerB(ref FMat4x3 gameMat) {
  FVec3 psiThetaPhi;
  
  psiThetaPhi.x = std::math::atan2(-gameMat.a.y, -gameMat.a.z);
  psiThetaPhi.y = -Pi / 2.f;

  return psiThetaPhi;
};

fn GameToEulerC(ref FMat4x3 gameMat) {
  FVec3 psiThetaPhi;
  
  psiThetaPhi.x = std::math::atan2(gameMat.a.y, gameMat.a.z);
  psiThetaPhi.y = Pi / 2.f;

  return psiThetaPhi;
};

fn GameToEuler(ref FMat4x3 gameMat) {
  FVec3 psiThetaPhi;
  
  if (!apex::math::AlmostEqual(gameMat.c.x, 1) && !apex::math::AlmostEqual(gameMat.c.x, -1)) {
    psiThetaPhi = GameToEulerA(gameMat);
  }
  if (apex::math::AlmostEqual(gameMat.c.x, 1)) {
    psiThetaPhi = GameToEulerB(gameMat);
  }
  if (apex::math::AlmostEqual(gameMat.c.x, -1)) {
    psiThetaPhi = GameToEulerC(gameMat);
  }
  
  FVec3 value;
  value.x = apex::math::RadiansToDegrees(psiThetaPhi.x);
  value.y = apex::math::RadiansToDegrees(psiThetaPhi.y);
  value.z = apex::math::RadiansToDegrees(psiThetaPhi.z);
  
  return value;
};

fn EulerToGame(ref FVec3 eulerVec) {
  float psi = apex::math::DegreesToRadians(eulerVec.x);
  float theta = apex::math::DegreesToRadians(eulerVec.y);
  float phi = apex::math::DegreesToRadians(eulerVec.z);
  
  FMat4x3 gameMat;
  gameMat.a.x = std::math::cos(theta) * std::math::cos(phi);
  gameMat.a.y = std::math::sin(psi) * std::math::sin(theta) * std::math::cos(phi) - std::math::cos(psi) * std::math::sin(phi);
  gameMat.a.z = std::math::cos(psi) * std::math::sin(theta) * std::math::cos(phi) + std::math::sin(psi) * std::math::sin(phi);
  
  gameMat.b.x = std::math::cos(theta) * std::math::sin(phi);
  gameMat.b.y = std::math::sin(psi) * std::math::sin(theta) * std::math::sin(phi) - std::math::cos(psi) * std::math::cos(phi);
  gameMat.b.z = std::math::cos(psi) * std::math::sin(theta) * std::math::sin(phi) + std::math::sin(psi) * std::math::cos(phi);
  
  gameMat.c.x = -std::math::sin(theta);
  gameMat.c.y = std::math::sin(psi) * std::math::cos(theta);
  gameMat.c.z = std::math::cos(psi) * std::math::cos(theta);
  
  return gameMat;
};


FMat4x3 GameMat @ 0x00;
FVec3 Euler = GameToEuler(GameMat);
FMat4x3 Game = EulerToGame(Euler);

std::print("---");
std::print("Game to Euler");
std::print("{}", Euler);
std::print("---");
std::print("Euler to Game");
std::print("{}", Game);
std::print("---");
