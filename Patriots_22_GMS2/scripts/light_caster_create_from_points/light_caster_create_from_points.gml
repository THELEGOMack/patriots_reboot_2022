/// @description light_caster_create_from_points(lighting_system, points_x, points_y)
/// @param lighting_system The ds_list representing the lighting system for this caster.
/// @param points_x A ds_list with the x coordinates of the cast points.
/// @param points_y A ds_list with the y coordinates of the cast points.
/// @return caster A ds_list representing the caster.
function light_caster_create_from_points(argument0, argument1, argument2) {
	/*
	Creates a caster from the size of the object's sprite.
	You can generate the code for the points lists using the Caster Creator tool.
	Note that these lists now belong to the lighting system, which may destroy them
	     with light_destroy or light_caster_delete, if you need these lists you might
	     want to make a copy.
	*/

	var lighting_system, x_offset, y_offset, width, height, points_x, points_y, x_min, y_min, x_max, y_max, enable, angle, caster, casters;

	lighting_system = argument0;
	points_x = argument1;
	points_y = argument2;

	x_offset = sprite_get_xoffset(sprite_index);
	y_offset = sprite_get_yoffset(sprite_index);
	width = sprite_get_width(sprite_index);
	height = sprite_get_height(sprite_index);

	x_min = 0;
	y_min = 0;
	x_max = 0;
	y_max = 0;

	enable = true;
	angle = 0;

	caster = ds_list_create();

	ds_list_add(caster, points_x); // 0
	ds_list_add(caster, points_y); // 1
	ds_list_add(caster, x_min); // 2
	ds_list_add(caster, y_min); // 3
	ds_list_add(caster, x_max); // 4
	ds_list_add(caster, y_max); // 5
	ds_list_add(caster, x); // 6
	ds_list_add(caster, y); // 7
	ds_list_add(caster, enable); // 8
	ds_list_add(caster, angle); // 9

	light_caster_bounding_box(caster);

	casters = ds_list_find_value(lighting_system, 10);
	ds_list_add(casters, caster);

	return caster;



}
