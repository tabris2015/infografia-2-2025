shader_type canvas_item;

uniform float stretch_amount : hint_range(-100.0, 100.0) = 0.0;
void vertex() {
	// UV.y va desde 0.0 (arriba) a 1.0 (abajo)
	// (UV.y - 0.5) -> arriba = -0.5, abajo 0.5
	float vertical_offset_factor = UV.y - 0.5;
	// la posicion en y de los vertices tiene que alejarse del centro
	// basado en el stretch_amount
	VERTEX.y += stretch_amount * vertical_offset_factor * MODEL_MATRIX[1][1];
	// para preservar el volumen, si estiramos en y, comprimimos en x
	float horizontal_offset_factor = UV.x - 0.5;
	VERTEX.x -= stretch_amount * horizontal_offset_factor * MODEL_MATRIX[0][0];
}


