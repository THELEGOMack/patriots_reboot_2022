/// @description light_caster_set_enable(light, enable)
/// @param caster The caster to affect.
/// @param enable Whether to enable or disable a caster.
function light_caster_set_enable(argument0, argument1) {
	/*
	Sets the enable flag for a caster.
	*/

	var caster, enable;

	caster = argument0;
	enable = argument1;

	ds_list_set(caster, 8, enable);



}
