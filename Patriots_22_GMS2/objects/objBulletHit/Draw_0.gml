gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 1, choose(1, -1), image_angle, _color, _alpha);
gpu_set_blendmode(bm_normal);