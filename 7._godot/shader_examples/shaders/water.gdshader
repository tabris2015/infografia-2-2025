shader_type canvas_item;
uniform float speed = 2.0;
uniform float magnitude = 0.05;
uniform float frequency = 10.0;

void fragment() {
	// distancia desde el centro
	float dist = distance(UV, vec2(0.5));
	// onda senoidal basada en la distancia y el tiempo
	float wave_factor = sin(dist * frequency - TIME * speed);
	vec2 distorded_uv = UV + vec2(wave_factor) * magnitude;
	vec4 original_color = texture(TEXTURE, distorded_uv);
	COLOR = original_color;
}