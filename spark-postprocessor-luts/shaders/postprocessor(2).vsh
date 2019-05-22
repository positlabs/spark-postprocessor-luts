attribute vec3 position;
uniform vec2 uRenderSize;
varying vec2 hdConformedUV;
varying vec2 uv;

vec2 calculateHdConformedUV(vec2 uv, vec2 uRenderSize) {
  float longestDim = max(uRenderSize.x, uRenderSize.y);
  float ratio = longestDim / 1280.0;
  vec2 hdConformedUV = vec2(0.0);
  if (uRenderSize.y >= uRenderSize.x) {
    hdConformedUV.x = uv.x * uRenderSize.x / (uRenderSize.x / ratio);
    hdConformedUV.y = uv.y * ratio;
  } else {
    hdConformedUV.x = uv.x * ratio;
    hdConformedUV.y = uv.y * uRenderSize.y / (uRenderSize.y / ratio);
  }
  return hdConformedUV;
}

void main() {
  gl_Position = vec4(position, 1.0);
  uv = position.xy * 0.5 + 0.5;
  hdConformedUV = calculateHdConformedUV(uv, uRenderSize);
}
