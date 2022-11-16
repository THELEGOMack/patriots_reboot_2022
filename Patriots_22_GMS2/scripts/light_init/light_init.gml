/// @description light_init(width, height, light_size, ambient_color, quality, iterations, mask)
/// @param width Width of the shadow map.
/// @param height Height of the shadow map.
/// @param light_size The size of the lightmaps, should be set to the largest light.
/// @param ambient_color The shadow color, this also controls the darkness of the shadows.
/// @param quality  The lightmap quality, 0 to 1.
/// @param iterations How many times a second to draw the lightmap.
/// @param mask A black and transparent sprite to shape the light map with.
/// @return A ds_list representing a lighting system.
function light_init(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	/*
	Sets up lighting variables.

	Notes:
	iterations - How many times a second to draw the lightmap. The default is the room speed
	             but you might want to reduce this for increased performance. If it is too
	             small, however, you will notice considerable stuttering.
	mask - A black and transparent sprite to shape the light map with. The transparent areas will have
	       the light map and the black areas will not. Notice that using a mask comes with
	       increased memory costs. Note also that, since they use the application_surface, masked
	       lighting systems do not work with multiple views.
	*/

	var width, height, light_size, ambient_color, quality, max_time, time, mask, light_surface, light_map, mask_surface, lights, casters, lighting_system;

	width = argument0;
	height = argument1;
	light_size = argument2;
	ambient_color = argument3;
	quality = argument4;
	if (argument5 < 0 || argument5 == room_speed)
	{
	    max_time = 0;
	}
	else
	{
	    max_time = 1000000 / argument5;
	}
	mask = argument6;
	time = 0;
	light_surface = surface_create(light_size * quality, light_size * quality);
	light_map = surface_create(width * quality, height * quality);

	mask_surface = -1;
	if (sprite_exists(mask))
	{
	    mask_surface = surface_create(width * quality, height * quality);
	}

	lights = ds_list_create();
	casters = ds_list_create();

	lighting_system = ds_list_create();

	ds_list_add(lighting_system, width); // 0
	ds_list_add(lighting_system, height); // 1
	ds_list_add(lighting_system, light_size); // 2
	ds_list_add(lighting_system, ambient_color); // 3
	ds_list_add(lighting_system, quality); // 4
	ds_list_add(lighting_system, max_time); // 5
	ds_list_add(lighting_system, time); // 6
	ds_list_add(lighting_system, light_surface); // 7
	ds_list_add(lighting_system, light_map); // 8
	ds_list_add(lighting_system, lights); // 9
	ds_list_add(lighting_system, casters); // 10
	ds_list_add(lighting_system, mask); // 11
	ds_list_add(lighting_system, mask_surface); // 12

	return lighting_system;



}
