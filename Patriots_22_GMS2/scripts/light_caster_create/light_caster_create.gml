/// @description light_caster_create(lighting_system)
/// @param lighting_system The ds_list representing the lighting system for this caster.
/// @return caster A ds_list representing the caster.
function light_caster_create(argument0) {
	/*
	Creates a caster from the size of the object's sprite.
	*/

	var lighting_system, x_offset, y_offset, width, height, points_x, points_y, x_min, y_min, x_max, y_max, enable, angle, caster, casters;

	lighting_system = argument0;

	x_offset = sprite_get_xoffset(sprite_index);
	y_offset = sprite_get_yoffset(sprite_index);
	width = sprite_get_width(sprite_index);
	height = sprite_get_height(sprite_index);

	points_x = ds_list_create();
	points_y = ds_list_create();

	ds_list_add(points_x, -x_offset);
	ds_list_add(points_y, -y_offset);

	ds_list_add(points_x, width - x_offset);
	ds_list_add(points_y, -y_offset);

	ds_list_add(points_x, width - x_offset);
	ds_list_add(points_y, height - y_offset);

	ds_list_add(points_x, -x_offset);
	ds_list_add(points_y, height - y_offset);

	x_min = -x_offset;
	y_min = -y_offset;
	x_max = width - x_offset;
	y_max = height - y_offset;

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

	casters = ds_list_find_value(lighting_system, 10);
	ds_list_add(casters, caster);

	return caster;



}
