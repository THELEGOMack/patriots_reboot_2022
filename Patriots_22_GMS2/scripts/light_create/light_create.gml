/// @description light_create(lighting_system, light_sprite, light_scale, light_color, light_alpha, light_angle, shadows)
/// @param lighting_system The ds_list representing the lighting system.
/// @param light_sprite Gradient sprite to use.
/// @param light_scale Scale of the sprite.
/// @param light_color The light color.
/// @param light_alpha Brightness of the light, from 0 to 1.
/// @param light_angle The rotation of the light.
/// @param shadows If this light should draw shadows.
/// @return light a ds_list representing the light.
function light_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	/*
	Creates a light and stores variables for it in a ds_list.
	*/

	var lighting_system,sprite, scale, color, alpha, angle, shadows, max_distance, x_pos, y_pos, enable, light, lights;

	lighting_system = argument0;
	sprite = argument1;
	scale = argument2;
	color = argument3;
	alpha = argument4;
	angle = argument5;
	shadows = argument6;

	max_distance = max(sprite_get_width(sprite), sprite_get_height(sprite)) * scale;
	x_pos = 0;
	y_pos = 0;
	enable = true;

	light = ds_list_create();

	ds_list_add(light, sprite); // 0
	ds_list_add(light, scale); // 1
	ds_list_add(light, color); // 2
	ds_list_add(light, alpha); // 3
	ds_list_add(light, angle); // 4
	ds_list_add(light, shadows); // 5
	ds_list_add(light, max_distance); // 6
	ds_list_add(light, x_pos); // 7
	ds_list_add(light, y_pos); // 8
	ds_list_add(light, enable); // 9

	lights = ds_list_find_value(lighting_system, 9);
	ds_list_add(lights, light);

	return light;



}
