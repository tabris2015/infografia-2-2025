shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float magnitude = 0.02;
void fragment() {
	float mask = texture(TEXTURE, UV).r;
	vec2 direction = normalize(UV - vec2(0.5));
	vec2 offset_r = direction * magnitude * mask * 0.8;
	vec2 offset_g = direction * magnitude * mask * 1.0;
	vec2 offset_b = direction * magnitude * mask * 1.2;
	
	float r = texture(SCREEN_TEXTURE, SCREEN_UV - offset_r).r;
	float g = texture(SCREEN_TEXTURE, SCREEN_UV - offset_g).g;
	float b = texture(SCREEN_TEXTURE, SCREEN_UV - offset_b).b;
	
	float a = texture(SCREEN_TEXTURE, SCREEN_UV).a;
	
	COLOR = vec4(r,g,b,a);
	
}
