gpu_set_blendmode(bm_add);
draw_sprite_ext(sprHalo, 0, x, y, 0.5, 0.5, 0, c_white, random_range(0.10, 0.12));
gpu_set_blendmode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, image_angle, global.shadowHue, global.shadowAlpha);
draw_self();