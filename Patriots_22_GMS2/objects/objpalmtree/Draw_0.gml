color1 = merge_color(c_green,merge_color(merge_color(c_lime,c_aqua,0.5+lengthdir_x(0.5,direction*3.12)),c_white,0.125+lengthdir_y(0.125,direction*1.73)),0.75+lengthdir_y(0.25,direction*1.73))
draw_sprite_ext(sprite_index, image_index, x+2, y+2, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color1,0.4)