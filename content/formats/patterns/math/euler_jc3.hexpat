// Created by EonZeNx
// Expects FVector3 
#pragma once

import std.math;
import std.io;

import core.TTypes;
import core.CTypes;
import core.ApexTypes;

using FVec3 = CTypes::FVector3;
using FMat3x3 = CTypes::FMatrix3x3;
using FMat4x3 = CTypes::FMatrix4x3;


fn DegreesToRadians(float d) {
  const float pi = 3.141592653f;
  
  float r = (d * pi) / 180.f;
  return r;
};

fn D2R(float d) {
  return DegreesToRadians(d);
};


fn EulerToRx(ref FVec3 vec) {
  float xRadians = D2R(vec.x);
  float sinRad = std::math::sin(xRadians);
  float cosRad = std::math::cos(xRadians);
  
  FMat3x3 rx;
  
  rx.a.x = 1.f;
  
  rx.b.y = cosRad;
  rx.b.z = -sinRad;
  
  rx.c.y = sinRad;
  rx.c.z = cosRad;
  
  return rx;
};

fn EulerToRy(ref FVec3 vec) {
  float yRadians = D2R(vec.y);
  float sinRad = std::math::sin(yRadians);
  float cosRad = std::math::cos(yRadians);
  
  FMat3x3 ry;
  
  ry.a.x = cosRad;
  ry.a.z = sinRad;
  
  ry.b.y = 1.f;
  
  ry.c.x = -sinRad;
  ry.c.z = cosRad;
  
  return ry;
};

fn EulerToRz(ref FVec3 vec) {
  float zRadians = D2R(vec.z);
  float sinRad = std::math::sin(zRadians);
  float cosRad = std::math::cos(zRadians);
  
  FMat3x3 rz;
  
  rz.a.x = cosRad;
  rz.a.y = -sinRad;
  
  rz.b.x = sinRad;
  rz.b.y = cosRad;
  
  rz.c.z = 1.f;
  
  return rz;
};

FVec3 Euler @ 0x00;

FMat3x3 rx = EulerToRx(Euler);
std::print("---");
std::print("rx");
std::print("{}", rx);

FMat3x3 ry = EulerToRy(Euler);
std::print("---");
std::print("ry");
std::print("{}", ry);

FMat3x3 rz = EulerToRz(Euler);
std::print("---");
std::print("rz");
std::print("{}", rz);


FMat3x3 rxRot;
rxRot.a.x = 1.f;
rxRot.b.y = 1.f;
rxRot.c.z = 1.f;

std::print("---");
std::print("rxRot");
std::print("{}", rxRot);



fn MultVec3ByVec3(TTypes::Vector3<float> a, TTypes::Vector3<float> b) {
  TTypes::Vector3<float> result;
  
  result.x = a.x * b.x;
  result.y = a.y * b.y;
  result.z = a.z * b.z;
  
  return result;
};

fn SumVec3(TTypes::Vector3<float> a) {
  float result = a.x + a.y + a.z;
  
  return result;
};


fn GetXRot(ref FMat3x3 rotator) {
  TTypes::Vector3<float> result;
  result.x = rotator.a.x;
  result.y = rotator.b.x;
  result.z = rotator.c.x;
  
  return result;
};

fn GetYRot(ref FMat3x3 rotator) {
  TTypes::Vector3<float> result;
  result.x = rotator.a.y;
  result.y = rotator.b.y;
  result.z = rotator.c.y;
  
  return result;
};

fn GetZRot(ref FMat3x3 rotator) {
  TTypes::Vector3<float> result;
  result.x = rotator.a.z;
  result.y = rotator.b.z;
  result.z = rotator.c.z;
  
  return result;
};


fn CalcXRot(TTypes::Vector3<float> target, FMat3x3 rotator) {
  TTypes::Vector3<float> rotVec = GetXRot(rotator);
  
  TTypes::Vector3<float> mult = MultVec3ByVec3(target, rotVec);
  float result = SumVec3(mult);
  
  return result;
};

fn CalcYRot(TTypes::Vector3<float> target, FMat3x3 rotator) {
  TTypes::Vector3<float> rotVec = GetYRot(rotator);
  
  TTypes::Vector3<float> mult = MultVec3ByVec3(target, rotVec);
  float result = SumVec3(mult);
  
  return result;
};

fn CalcZRot(TTypes::Vector3<float> target, FMat3x3 rotator) {
  TTypes::Vector3<float> rotVec = GetZRot(rotator);
  
  TTypes::Vector3<float> mult = MultVec3ByVec3(target, rotVec);
  float result = SumVec3(mult);
  
  return result;
};


FMat3x3 ryRot;
ryRot.a.x = CalcXRot(rx.a, rxRot);
ryRot.a.y = CalcYRot(rx.a, rxRot);
ryRot.a.z = CalcZRot(rx.a, rxRot);

ryRot.b.x = CalcXRot(rx.b, rxRot);
ryRot.b.y = CalcYRot(rx.b, rxRot);
ryRot.b.z = CalcZRot(rx.b, rxRot);

ryRot.c.x = CalcXRot(rx.c, rxRot);
ryRot.c.y = CalcYRot(rx.c, rxRot);
ryRot.c.z = CalcZRot(rx.c, rxRot);

std::print("---");
std::print("ryRot");
std::print("{}", ryRot);


FMat3x3 rzRot;
rzRot.a.x = CalcXRot(ry.a, ryRot);
rzRot.a.y = CalcYRot(ry.a, ryRot);
rzRot.a.z = CalcZRot(ry.a, ryRot);

rzRot.b.x = CalcXRot(ry.b, ryRot);
rzRot.b.y = CalcYRot(ry.b, ryRot);
rzRot.b.z = CalcZRot(ry.b, ryRot);

rzRot.c.x = CalcXRot(ry.c, ryRot);
rzRot.c.y = CalcYRot(ry.c, ryRot);
rzRot.c.z = CalcZRot(ry.c, ryRot);

std::print("---");
std::print("rzRot");
std::print("{}", rzRot);



FMat3x3 result;
result.a.x = CalcXRot(rz.a, rzRot);
result.a.y = CalcYRot(rz.a, rzRot);
result.a.z = CalcZRot(rz.a, rzRot);

result.b.x = CalcXRot(rz.b, rzRot);
result.b.y = CalcYRot(rz.b, rzRot);
result.b.z = CalcZRot(rz.b, rzRot);

result.c.x = CalcXRot(rz.c, rzRot);
result.c.y = CalcYRot(rz.c, rzRot);
result.c.z = CalcZRot(rz.c, rzRot);

std::print("---");
std::print("result");
std::print("{}", result);
std::print("---");
