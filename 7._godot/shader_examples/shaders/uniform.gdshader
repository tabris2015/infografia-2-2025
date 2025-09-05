shader_type canvas_item;
// 'uniform' expone una variable en el inspector. Se puede modificar en tiempo
uniform vec4 rect_color : source_color;
uniform float opacity : hint_range(0.0, 1.0) = 1.0;
void fragment() {
	COLOR.rgb = rect_color.rgb;
	COLOR.a = opacity;
}
