//cursor
draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

//draw overlay(s)
//dip-to-black
//draw_clear_alpha(c_black, fadeAlpha)