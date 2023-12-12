//draw gradient
if gradient = true
{
	gpu_set_blendmode(bm_subtract);
	draw_rectangle_color(x + (32*gradientLength) + 8, y, x - (16*image_xscale*2) + 7, y + (16*image_yscale) - 1, merge_color(c_black, c_white, gAlpha), c_black, c_black, merge_color(c_black, c_white, gAlpha), 0);
	gpu_set_blendmode(bm_normal);
}

//hitbox testing
//draw_self();

//draw arrow
if vis = true
{
	if active = true
	{
		draw_sprite_ext(_spr, imgSpd, x - 8 - bobAmt, y + (8*image_yscale), 1, 1, dir, c_white, 1);
	} else {
		draw_sprite_ext(_spr, 0, x - 8, y + (8*image_yscale), 1, 1, dir, c_white, 0.25);
	}
}