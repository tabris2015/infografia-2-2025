shader_type canvas_item;
uniform float sepia_strength : hint_range(0.0, 1.0) = 1.0;
void fragment() {
	vec4 original_color = texture(TEXTURE, UV);
	float luminance = dot(original_color.rgb, vec3(0.299, 0.587, 0.114));
	// crear pixel en tono sepia
	vec3 sepia_color = vec3(luminance * 1.0, luminance * 0.95, luminance * 0.75);
	// mezclar color calculado con el strength para el color final
	vec3 final_color = mix(original_color.rgb, sepia_color, sepia_strength);
	// asignamos al color de salida
	COLOR = vec4(final_color, original_color.a);
}

