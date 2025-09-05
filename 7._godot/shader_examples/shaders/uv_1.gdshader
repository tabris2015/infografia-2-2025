shader_type canvas_item;

void fragment() {
	// UV es la posicion del pixel
	// UV es un vec2, donde UV.x es la posicion en x (0, 1), UV.y es posicion en y (0, 1)
	float diagonal_value = (UV.x + UV.y) / 2.0;
	COLOR = vec4(diagonal_value, diagonal_value, 0.0, 1.0);
}
