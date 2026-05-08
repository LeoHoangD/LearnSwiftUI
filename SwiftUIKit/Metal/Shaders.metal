//
//  Shaders.metal
//  SwiftUIKit
//
//  Created by Huệ Huệ on 11/10/25.
//

#include <metal_stdlib>
using namespace metal;

// MARK: - The GPU Canvas

[[ stitchable ]] half4 solidRed(float2 position, half4 color) {
    return half4(1.0, 0, 0, 1.0);
}


[[ stitchable ]] half4 solidGreen(float2 position, half4 color) {
    return half4(0, 1.0, 0, 1.0);
}


[[ stitchable ]] half4 solidBlue(float2 position, half4 color) {
    return half4(0, 0, 1.0, 1.0);
}

[[stitchable]] half4 adjustableBrightness(
    float2 position,
    half4 color,
    float brightness
) {
    return half4(color.rgb * brightness, color.a);
}

// MARK: Color channel filter isolation
[[ stitchable ]] half4 redChannelFilter(float2 position, half4 color) {
    return half4(color.r, 0, 0, color.a);
}

[[ stitchable ]] half4 greenChannelFilter(float2 position, half4 color) {
    return half4(0, color.g, 0, color.a);
}

[[ stitchable ]] half4 blueChannelFilter(float2 position, half4 color) {
    return half4(0, 0, color.b, color.a);
}

// MARK: Color effect

// hàm này vẫn chưa chạy đc
[[ stitchable ]] half4 pulsingColor(float2 position, half4 color, float time) {
    // Define two base colors
    float3 color1 = float3(0.1, 0.3, 0.8); // Deep blue
    float3 color2 = float3(0.8, 0.4, 0.6); // Pink

    // Create a smooth oscillation between 0 and 1
    float t = 0.5 + 0.5 * sin(2*time);

    // Optionally add spatial variation to make it more "wavy"
//    float gradient = 0.5 + 0.5 * sin(position.y * 0.01 + time);

    // Combine time-based pulse and position-based gradient
//    float mixFactor = mix(t, gradient, 0.5);

    // Interpolate between color1 and color2
    float3 finalColor = mix(color1, color2, t);

    return half4(finalColor.r, finalColor.g, finalColor.b, 1.0);
}

[[ stitchable ]] half4 breathingGradient(
  float2 position,
  half4 color,
  float2 size,
  float time
) {
  float2 uv = position / size;

  // Create a breathing effect using sine waves
  float breathe = sin(time * 2.0) * 0.5 + 0.5;  // 0 to 1, 2 second period

  // Use breathing to modify gradient position
  float gradientPos = uv.y + breathe * 0.2 - 0.1;

  // Create smooth gradient with animated colors
  float3 color1 = float3(0.1, 0.3, 0.8);  // Deep blue
  float3 color2 = float3(0.8, 0.4, 0.6);  // Pink

  // Animate the colors too
  color1.r += sin(time * 1.5) * 0.2;
  color2.g += sin(time * 0.7) * 0.2;

  // Smooth gradient
  float3 gradientColor = mix(color1, color2, smoothstep(0.0, 1.0, gradientPos));

  return half4(gradientColor.r, gradientColor.g, gradientColor.b, 1.0);
}

// MARK: - The UV Coordinate System

// ---> Sample code
[[ stitchable ]] half4 horizontalGradient(float2 position, half4 color, float2 size) {
  float2 uv = position / size;
  return half4(uv.x, uv.x, uv.x, 1.0);
}

[[ stitchable ]] half4 circle(float2 position, half4 color, float2 size) {
  float2 uv = position / size;
  float2 center = uv - 0.5;  // Center at (0,0)

  float dist = length(center);  // Distance from center

  if (dist >= 0.5) {
      return half4(0.0, 0.0, 0.0, 1.0);  // Black outside
  } else {
      return half4(1.0, 1.0, 1.0, 1.0);  // White inside
  }
}

[[ stitchable ]] half4 smoothCircle(float2 position, half4 color, float2 size) {
  float2 uv = position / size;
  float2 center = uv - 0.5;

  float dist = length(center);
  float circle = 1.0 - smoothstep(0.29, 0.31, dist);

  return half4(circle, circle, circle, 1.0);
}

[[ stitchable ]] half4 gridPattern(float2 position, half4 color, float2 size) {
  float2 uv = position / size;

  // Create 8x8 grid
  float2 grid = fract(uv * 8.0);

  // Draw lines at grid boundaries
  float lineWidth = 0.1;
  float lines = 0.0;

  if (grid.x < lineWidth || grid.y < lineWidth) {
      lines = 1.0;
  }

  return half4(lines, lines, lines, 1.0);
}

// ---> Challenge
[[ stitchable ]] half4 verticalGradient(float2 position, half4 color, float2 size) {
  float2 uv = position / size;
  return half4(uv.y, uv.y, uv.y, 1.0);
}
