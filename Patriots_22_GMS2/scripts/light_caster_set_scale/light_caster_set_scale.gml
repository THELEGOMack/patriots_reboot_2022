/// @description light_caster_set_scale(caster, x_scale, y_scale)
/// @param caster The caster to affect.
/// @param x_scale The x scale to apply.
/// @param y_scale The y scale to apply.
function light_caster_set_scale(argument0, argument1, argument2) {
	/*
	Scales the points in a caster.
	*/

	var caster, x_scale, y_scale, points_x, points_y, x_min, y_min, x_max, y_max;

	caster = argument0;
	x_scale = argument1;
	y_scale = argument2;

	points_x = ds_list_find_value(caster, 0);
	points_y = ds_list_find_value(caster, 1);

	x_min = ds_list_find_value(caster, 2);
	y_min = ds_list_find_value(caster, 3);
	x_max = ds_list_find_value(caster, 4);
	y_max = ds_list_find_value(caster, 5);

	for (var i = 0; i < ds_list_size(points_x); i++)
	{
	    var x_pos, y_pos;
	    x_pos = ds_list_find_value(points_x, i) * x_scale;
	    ds_list_set(points_x, i, x_pos);
    
	    y_pos = ds_list_find_value(points_y, i) * y_scale;
	    ds_list_set(points_y, i, y_pos);
    
	    x_min = min(x_min, x_pos);
	    y_min = min(y_min, y_pos);
	    x_max = max(x_max, x_pos);
	    y_max = max(y_max, y_pos);
	}

	ds_list_set(caster, 2, x_min);
	ds_list_set(caster, 3, y_min);
	ds_list_set(caster, 4, x_max);
	ds_list_set(caster, 5, y_max);



}
