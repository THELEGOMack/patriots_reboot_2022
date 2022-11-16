//
// Blur fragment shader.
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float blur; // Best if set between 0 and 1.
void main()
{
    float offset = blur / 100.0;
    vec2 t0 = v_vTexcoord + vec2(-offset, -offset);
    vec2 t1 = v_vTexcoord + vec2(0.0, -offset);
    vec2 t2 = v_vTexcoord + vec2(offset, -offset);
    vec2 t3 = v_vTexcoord + vec2(-offset, 0.0);
    vec2 t4 = v_vTexcoord + vec2(0.0, 0.0);
    vec2 t5 = v_vTexcoord + vec2(offset, 0.0);
    vec2 t6 = v_vTexcoord + vec2(-offset, offset);
    vec2 t7 = v_vTexcoord + vec2(0.0, offset);
    vec2 t8 = v_vTexcoord + vec2(+offset, offset);

    vec4 c0 = texture2D(gm_BaseTexture, t0);
    vec4 c1 = texture2D(gm_BaseTexture, t1);
    vec4 c2 = texture2D(gm_BaseTexture, t2);
    vec4 c3 = texture2D(gm_BaseTexture, t3);
    vec4 c4 = texture2D(gm_BaseTexture, t4);
    vec4 c5 = texture2D(gm_BaseTexture, t5);
    vec4 c6 = texture2D(gm_BaseTexture, t6);
    vec4 c7 = texture2D(gm_BaseTexture, t7);
    vec4 c8 = texture2D(gm_BaseTexture, t8);

    vec4 sum = (c0 + c1 * 2.0 + c2 + c3 * 2.0 + c4 * 4.0 + c5 * 2.0 + c6 + c7 * 2.0 + c8) / 16.0;

    gl_FragColor = vec4(sum.rgb, 1.0) * v_vColour;
}
