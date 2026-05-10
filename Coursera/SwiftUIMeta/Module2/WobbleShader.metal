//
//  WobbleShader.metal
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 31/3/26.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] float2 wobble(float2 position, float amplitude) {
    return float2(position.x, position.y + amplitude * sin(position.x));
}
