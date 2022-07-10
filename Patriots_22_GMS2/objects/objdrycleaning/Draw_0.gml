draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

if (image_index = 0)
{
	draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, c_white, 0.5);
}

if (image_index = 1)
{
	draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, c_white, 0.5);
}