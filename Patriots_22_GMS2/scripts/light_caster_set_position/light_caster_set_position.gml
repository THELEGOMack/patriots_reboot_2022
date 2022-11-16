/// @description light_caster_set_position(caster, x, y)
/// @param caster The caster to affect.
/// @param x The x position of the caster.
/// @param y The y position of the caster.
function light_caster_set_position(argument0, argument1, argument2) {
	/*
	This will move the caster to the new position.
	*/

	var caster, x_pos, y_pos;

	caster = argument0;
	x_pos = argument1;
	y_pos = argument2;

	ds_list_set(caster, 6, x_pos);
	ds_list_set(caster, 7, y_pos);



}
