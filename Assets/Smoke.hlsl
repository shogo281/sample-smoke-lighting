#ifndef SAMPLE_SMOKE
#define SAMPLE_SMOKE

void ComputeLighting_float(in float4 lightMap, in float3 color, in float3 lightDir, in float3 normal, out float3 result)
{
    // なんか逆。
    float x = lightDir.x < 0.0f ? lightMap.x : lightMap.y;
    float y = lightDir.y < 0.0f ? lightMap.z : lightMap.w;
    // これでxyzwから前後の接線が求められる。
    float front = 0.25f * (lightMap.x + lightMap.y + lightMap.z + lightMap.w);
    front = pow(front, 0.625f);
    float back = 1.0f - front;
    back = saturate(0.25f * (1.0f - normal.x) + 0.5f * (back * back * back * back));
    float z = lightDir.z > 0.0f ? front : back;
    // float albedo = x * lightDir.x * lightDir.x + y * lightDir.y * lightDir.y + z * lightDir.z * lightDir.z;
    float albedo = dot(float3(x, y, z), lightDir * lightDir);
    result = color * albedo;
}
#endif