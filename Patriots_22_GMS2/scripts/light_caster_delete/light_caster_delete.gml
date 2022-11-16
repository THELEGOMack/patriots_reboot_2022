/// @description light_caster_delete(caster)
/// @param caster The ds_list representing the caster. Returned from one of the caster create functions.
function light_caster_delete(argument0) {
	/*
	Delete a caster. This destroys all memory associated with a caster.
	*/

	var caster, points_x, points_y;

	caster = argument0;

	points_x = ds_list_find_value(caster, 0);
	points_y = ds_list_find_value(caster, 1);

	ds_list_destroy(points_x);
	ds_list_destroy(points_y);

	ds_list_destroy(caster);




}
