/// @description light_caster_bounding_box(caster)
/// @param caster  A ds_list representing a shadow caster.
function light_caster_bounding_box(argument0) {
	/*
	Recalculate the bounding box for a caster. This is used internally when rotating, resizing, and creating casters.
	*/

	var caster, points_x, points_y, x_min, x_max, y_min, y_max;

	caster = argument0;

	points_x = ds_list_find_value(caster, 0);
	points_y = ds_list_find_value(caster, 1);

	x_min = ds_list_find_value(points_x, 0);
	x_max = x_min;
	y_min = ds_list_find_value(points_y, 0);
	y_max = y_min;
	for (var i = 1; i < ds_list_size(points_x); i++)
	{
	    var value;
	    value = ds_list_find_value(points_x, i);
	    x_min = min(x_min, value);
	    x_max = max(x_max, value);
    
	    value = ds_list_find_value(points_y, i);
	    y_min = min(y_min, value);
	    y_max = max(y_max, value);
	}

	ds_list_set(caster, 2, x_min);
	ds_list_set(caster, 3, y_min);
	ds_list_set(caster, 4, x_max);
	ds_list_set(caster, 5, y_max);



}
