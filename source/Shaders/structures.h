//
//  structures.h
//  Metal ray-tracer
//
//  Created by Sergey Reznik on 9/15/18.
//  Copyright © 2018 Serhii Rieznik. All rights reserved.
//

#pragma once

#include <MetalPerformanceShaders/MetalPerformanceShaders.h>
#include "constants.h"

#if !defined(__METAL_VERSION__)
using packed_float3 = MPSPackedFloat3;
using uint = uint32_t;
#endif

struct Vertex
{
    packed_float3 v;
    packed_float3 n;
    packed_float2 t;
};

struct Material
{
    packed_float3 diffuse;
    uint type = MATERIAL_DIFFUSE;
    packed_float3 emissive;
};

struct Triangle
{
    uint materialIndex;
};

struct Ray
{
    MPSRayOriginMinDistanceDirectionMaxDistance base;
    packed_float3 radiance;
};

struct ApplicationData
{
    uint frameIndex;
};

using Intersection = MPSIntersectionDistancePrimitiveIndexCoordinates;
