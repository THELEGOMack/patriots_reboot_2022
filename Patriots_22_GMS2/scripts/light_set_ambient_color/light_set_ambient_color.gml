/// @description light_set_ambient_color(lighting_system, ambient_color)
/// @param lighting_system Lighting system to apply color to.
/// @param ambient_color Color to make the shadows.
function light_set_ambient_color(argument0, argument1) {
	/*
	Sets the ambient color, this also controls the brightness.
	*/

	var lighting_system, color;

	lighting_system = argument0;
	color = argument1;

	ds_list_set(lighting_system, 3, color);



}
