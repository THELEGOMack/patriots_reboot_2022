//cursor
if (sprite_index != noone)
{
	draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, image_alpha/2);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}

//draw overlay(s)
//dip-to-black
draw_sprite_ext(sprPixel, 0, -room_width-60, -room_height-60, (room_width*2)+60,(room_height*2)+60, 0, c_black, fadeAlpha);