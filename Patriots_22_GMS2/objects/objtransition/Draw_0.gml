if active = true
{
	draw_sprite_ext(arrow, image_index, x, y, 1, 1, arrowDir, c_white, 1);
} else {
	draw_sprite_ext(arrow, image_index, x, y, 1, 1, arrowDir, c_white, 0.25);
}