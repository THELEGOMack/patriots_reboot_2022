//draw gradient
if gradient = true
{
	gpu_set_blendmode(bm_subtract);
	draw_rectangle_color(x, y - (32*gradientLength) + 8, x+(16*image_xscale) - 1, y+(16*image_yscale*2) - 1, merge_color(c_black, c_white, gAlpha), merge_color(c_black, c_white, gAlpha), c_black, c_black, 0);
	gpu_set_blendmode(bm_normal);
}

//hitbox testing
//draw_self();

//draw arrow
if vis = true
{
	if active = true
	{
		draw_sprite_ext(_spr, imgSpd, x + (8*image_xscale), y - 8 - bobAmt, 1, 1, dir, c_white, 1);
	} else {
		draw_sprite_ext(_spr, 0, x + (8*image_xscale), y - 8, 1, 1, dir, c_white, 0.25);
	}
}