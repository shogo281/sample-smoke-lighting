#ifndef SAMPLE_SMOKE
#define SAMPLE_SMOKE
void ComputeLighting_float(in float4 mask01, in float4 mask02, in float3 color, in float3 lightDir, out float4 result)
{
    float lightMap = lightDir.x + lightDir.y + lightDir.z;
    result.rgb = color * lightMap;
    result.a = mask01.a;
}
#endif