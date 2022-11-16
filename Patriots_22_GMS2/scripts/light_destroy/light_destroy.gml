/// @description light_destroy(lighting_system)
/// @param lighting_system The ds_list representing the lighting system to destroy.
function light_destroy(argument0) {
	/*
	Destroys all memory associated with a lighting system including the light map, lights, and casters.
	*/

	var lighting_system, light_surface, light_map, lights, casters;

	lighting_system = argument0;

	light_surface = ds_list_find_value(lighting_system, 7);
	light_map = ds_list_find_value(lighting_system, 8);
	lights = ds_list_find_value(lighting_system, 9);
	casters = ds_list_find_value(lighting_system, 10);

	surface_free(light_surface);
	surface_free(light_map);

	for (var i = 0; i < ds_list_size(lights); i++)
	{
	    if (ds_exists(i, ds_type_list))
	    {
	        light_delete(i);
	    }
	}
	ds_list_destroy(lights);

	for (var i = 0; i < ds_list_size(casters); i++)
	{
	    if (ds_exists(i, ds_type_list))
	    {
	        light_caster_delete(i);
	    }
	}
	ds_list_destroy(casters);

	ds_list_destroy(lighting_system);



}
