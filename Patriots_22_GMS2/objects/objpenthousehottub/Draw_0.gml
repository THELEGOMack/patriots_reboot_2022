//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha); bottom
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, c_white, 0.5);
gpu_set_blendmode(bm_normal);