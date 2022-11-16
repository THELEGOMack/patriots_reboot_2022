/// @description light_set_size(lighting_system, size)
/// @param lighting_system The lighting system to change the quality of.
/// @param size Size of the square surface in pixels.
function light_set_size(argument0, argument1) {
	/*
	Sets the maximum size of all lights and resizes the lighting surface after it has already been initalized.
	*/

	var lighting_system, size, light_surface, quality;

	lighting_system = argument0;
	size = argument1;

	ds_list_set(lighting_system, 2, size);

	light_surface = ds_list_find_value(lighting_system, 7);
	quality = ds_list_find_value(lighting_system, 4);

	surface_resize(light_surface, size * quality, size * quality);



}
