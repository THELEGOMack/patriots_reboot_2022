/// @description light_set_quality(lighting_system, quality)
/// @param lighting_system The lighting system to apply this quality setting to.
/// @param quality The quality of the lighting surfaces, from 0 to 1.
function light_set_quality(argument0, argument1) {
	/*
	Sets the light quality after the lights have been initialized.
	*/

	var lighting_system, quality, light_map, width, height, size, light_surface;

	lighting_system = argument0;
	quality = argument1;

	ds_list_set(lighting_system, 4, quality);

	width = ds_list_find_value(lighting_system, 0);
	height = ds_list_find_value(lighting_system, 1);
	size = ds_list_find_value(lighting_system, 2);
	light_surface = ds_list_find_value(lighting_system, 7);
	light_map = ds_list_find_value(lighting_system, 8);

	surface_resize(light_map, width * quality, height * quality);
	surface_resize(light_surface, size * quality, size * quality);



}
