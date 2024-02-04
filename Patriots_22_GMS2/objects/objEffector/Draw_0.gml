//cursor
if (sprite_index != noone)
{
	draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, image_alpha/2);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}

draw_text(x + 10, y + 10, "xInit: " + string(xInit))
draw_text(x + 10, y + 25, "yInit: " + string(yInit))
draw_text(x + 10, y + 40, "x: " + string(x))
draw_text(x + 10, y + 55, "y: " + string(y))