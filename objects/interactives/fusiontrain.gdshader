// Shader from https://godotshaders.com/shader/stylized-lava/
shader_type spatial;
render_mode shadows_disabled;

uniform vec4 dark_lava_color : source_color;
uniform vec4 light_lava_color : source_color;
uniform float speed : hint_range(0.0, 5.0);
uniform float scale : hint_range(0.1, 40.0) = 10;
uniform float sharpness : hint_range(1.0, 100.0);
uniform float emission_intensity : hint_range(0.0, 10.0);

varying vec3 uv1_power_normal;
uniform float uv1_blend_sharpness : hint_range(0.0, 150.0, 0.001);
varying vec3 uv1_triplanar_pos;
uniform vec3 uv1_scale;
uniform vec3 uv1_offset;

vec2 random2D(vec2 p) {
    return fract(sin(vec2(dot(p, vec2(127.1, 311.7)), dot(p, vec2(269.5, 183.3)))) * 43758.5453);
}

void vertex() {
	uv1_power_normal = pow(abs(NORMAL), vec3(uv1_blend_sharpness));
	uv1_triplanar_pos = VERTEX * uv1_scale + uv1_offset;
	uv1_power_normal /= dot(uv1_power_normal, vec3(1.0));
	uv1_triplanar_pos *= vec3(1.0, -1.0, 1.0);
}

vec4 triplanar_texture(sampler2D p_sampler, vec3 p_weights, vec3 p_triplanar_pos) {
	vec4 samp = vec4(0.0);
	samp += texture(p_sampler, p_triplanar_pos.xy) * p_weights.z;
	samp += texture(p_sampler, p_triplanar_pos.xz) * p_weights.y;
	samp += texture(p_sampler, p_triplanar_pos.zy * vec2(-1.0, 1.0)) * p_weights.x;
	return samp;
}

float voronoiIQ(vec2 _pos) {
    float _time = TIME * speed;
    _pos.y += _time;
    _pos.x += sin(_time);

    vec2 p = floor(_pos);
    vec2 f = fract(_pos);
    float res = 0.0;

    // Clamp the sharpness to avoid extreme behavior.
    float sharp = clamp(sharpness, 1.0, 50.0);

    // Sum contributions from neighboring cells.
    for (int j = -1; j <= 1; j++) {
        for (int i = -1; i <= 1; i++) {
            vec2 b = vec2(float(i), float(j));
            vec2 pnt = random2D(p + b);
            pnt = 0.5 + 0.5 * sin(_time + 6.2831 * pnt);
            vec2 r = vec2(b) - f + pnt;
            float d = dot(r, r);
            res += exp(-sharp * d);
        }
    }

    // Ensure we never take the log of zero.
    res = max(res, 1e-6);

    // Calculate the final value. Optionally, clamp the result.
    float result = -(1.0 / sharp) * log(res);
    return clamp(result, 0.0, 1.0);
}

void fragment() {
    vec2 uv = UV * scale;
    float voronoi_value = voronoiIQ(uv);

    vec4 final_color = mix(dark_lava_color, light_lava_color, voronoi_value);

	//vec4 albedo_tex = triplanar_texture(texture_albedo, uv1_power_normal, uv1_triplanar_pos);
    ALBEDO = final_color.rgb;
	EMISSION = final_color.rgb * emission_intensity;
}
