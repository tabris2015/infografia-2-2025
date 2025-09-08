shader_type canvas_item;
uniform float grayscale_strength : hint_range(0.0, 1.0) = 1.0;
void fragment() {
	// TEXTURE es una variable nativa que recupera el color de la textura original
	// Almacenar el color original en la posicion del pixel
	vec4 original_color = texture(TEXTURE, UV);
	// Calcular la 'luminancia' (brillo) del pixel original
	float luminance = dot(original_color.rgb, vec3(0.299, 0.587, 0.114));
	// crear pixel en escala de grises
	vec3 gray_color = vec3(luminance);
	// mezclar color calculado con el strength para el color final
	vec3 final_color = mix(original_color.rgb, gray_color, grayscale_strength);
	// asignamos al color de salida
	COLOR = vec4(final_color, original_color.a);
}

