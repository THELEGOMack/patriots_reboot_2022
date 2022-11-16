/// @description light_set_iterations(lighting_system, iterations)
/// @param iterations Number of times a second to draw lights and shaodws. Default is the room speed.
/// @param lighting_system The lighting system to apply this change to.
function light_set_iterations(argument0, argument1) {
	/*
	Set the number of times a second the lights and shadows should be drawn.
	*/

	var lighting_system, iterations, max_time;

	lighting_system = argument0;
	iterations = argument1;

	if (iterations < 0)
	{
	    max_time = 0;
	}
	else
	{
	    max_time = 1000000/ iterations;
	}

	ds_list_set(lighting_system, 5, iterations);



}
