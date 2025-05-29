shader_type spatial;

uniform vec4 decals_color : source_color;
uniform sampler2D decals_texture : source_color, filter_linear_mipmap, repeat_enable;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 albedo_tex = texture(decals_texture, UV);
	if (albedo_tex.r < 0.1) {
		ALPHA = 0.0;
	}
	else{
		ALBEDO = albedo_tex.rgb * decals_color.rgb;
	}

}
