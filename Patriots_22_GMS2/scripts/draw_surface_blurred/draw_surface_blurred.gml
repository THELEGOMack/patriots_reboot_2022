/// @description draw_surface_blurred(surface, x, y, x_scale, y_scale, blur_amount)
/// @param surface The surface to draw.
/// @param x The x location to draw the surface.
/// @param y The y location to draw the surface.
/// @param x_scale The x scale of the surface.
/// @param y_scale The y scale of the surface.
/// @param blur_amount How blurry the surfacr should be, numbers from 0 to 1 work well but even higher number can be used for increased blur.
function draw_surface_blurred(argument0, argument1, argument2, argument3, argument4, argument5) {
	/*
	Draw a surface with a blur.
	*/

	var surface, x_pos, y_pos, x_scale, y_scale, blur_amount, blur_shader;

	surface = argument0;
	x_pos = argument1;
	y_pos = argument2;
	x_scale = argument3;
	y_scale = argument4;
	blur_amount = argument5;

	blur_shader = shader_get_uniform(shd_blur, "blur");
	shader_set(shd_blur);
	shader_set_uniform_f(blur_shader, blur_amount);
	draw_surface_ext(surface, x_pos, y_pos, x_scale, y_scale, 0, c_white, 1);
	shader_reset()



}
