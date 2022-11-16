/// @description light_caster_set_rotation(caster, angle)
/// @param caster The caster to affect.
/// @param angle The angle of rotation in degrees.
function light_caster_set_rotation(argument0, argument1) {
	/*
	Rotates a caster.
	*/

	var caster, new_angle, points_x, points_y, old_angle, angle, x_min, y_min, x_max, y_max;

	caster = argument0;
	new_angle = argument1;

	points_x = ds_list_find_value(caster, 0);
	points_y = ds_list_find_value(caster, 1);
	old_angle = ds_list_find_value(caster, 9);

	if (new_angle == old_angle)
	{
	    return;
	}

	angle = new_angle - old_angle;

	x_min = ds_list_find_value(caster, 2);
	y_min = ds_list_find_value(caster, 3);
	x_max = ds_list_find_value(caster, 4);
	y_max = ds_list_find_value(caster, 5);

	for (var i = 0; i < ds_list_size(points_x); i++)
	{
	    var x_pos_old, y_pos_old, x_pos_new, y_pos_new;
	    x_pos_old = ds_list_find_value(points_x, i);
	    y_pos_old = ds_list_find_value(points_y, i);
    
	    x_pos_new = lengthdir_x(x_pos_old, angle) - lengthdir_y(y_pos_old, angle);
	    y_pos_new = lengthdir_y(x_pos_old, angle) + lengthdir_x(y_pos_old, angle);
    
	    ds_list_set(points_x, i, x_pos_new);
	    ds_list_set(points_y, i, y_pos_new);
    
	    x_min = min(x_min, x_pos_new);
	    y_min = min(y_min, y_pos_new);
	    x_max = max(x_max, x_pos_new);
	    y_max = max(y_max, y_pos_new);
	}

	ds_list_set(caster, 2, x_min);
	ds_list_set(caster, 3, y_min);
	ds_list_set(caster, 4, x_max);
	ds_list_set(caster, 5, y_max);
	ds_list_set(caster, 9, new_angle);



}
