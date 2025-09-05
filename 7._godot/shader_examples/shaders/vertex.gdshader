shader_type canvas_item;

uniform float wave_magnitude = 10.0;
uniform float wave_frequency = 5.0;

void vertex() {
	// se calcula y se ejecuta para cada VERTICE (esquina del mesh del sprite)
	// se puede manipular la geometria del sprite

	// TIME es una variable nativa que incrementa cada segundo
	float offset = sin(TIME + VERTEX.x / wave_frequency) * wave_magnitude;

	VERTEX.y += offset;
}
