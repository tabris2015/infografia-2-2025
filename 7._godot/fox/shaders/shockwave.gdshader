shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float magnitude = 0.1;
void fragment() {
	float mask = texture(TEXTURE, UV).r;
	vec2 direction = normalize(UV - vec2(0.5));
	// calcular valor de distorsion
	vec2 distorded_screen_uv = SCREEN_UV - direction * magnitude * mask;
	vec4 screen_color = texture(SCREEN_TEXTURE, distorded_screen_uv);
	COLOR = screen_color;
}
