shader_type canvas_item;
uniform vec4 outline_color : source_color = vec4(1.0,1.0,1.0,1.0);
uniform float outline_width = 2.0;
void fragment() {
	vec2 pixel_size = TEXTURE_PIXEL_SIZE;
	vec4 original_color = texture(TEXTURE, UV);
	float alpha_up = texture(TEXTURE, UV + vec2(0.0, -pixel_size.y * outline_width)).a;
	float alpha_down = texture(TEXTURE, UV + vec2(0.0, pixel_size.y * outline_width)).a;
	float alpha_left = texture(TEXTURE, UV + vec2(-pixel_size.y * outline_width, 0.0)).a;
	float alpha_right = texture(TEXTURE, UV + vec2(pixel_size.y * outline_width, 0.0)).a;
	// deteccion del border
	// si el pixel es transparente y al menos un vecino es opaco
	//					(a ~=0)							   (a > 0)
	if (
		original_color.a < 0.1 &&
		(alpha_up > 0.1 || alpha_down > 0.1 || alpha_left > 0.1 || alpha_right > 0.1)
	) {
		COLOR = outline_color;
	} else {
		COLOR = original_color;
	}
}
