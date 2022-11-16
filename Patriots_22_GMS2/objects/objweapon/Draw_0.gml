if ammo != 0
    {
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprHalo, 0, x, y, 0.25, 0.25, 0, c_white, random_range(0.10, 0.12));
	gpu_set_blendmode(bm_normal);
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.5)
    draw_sprite_ext(sprite_index,image_index,x-1+lengthdir_x(1,dir),y-1+lengthdir_x(1,dir),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
    draw_sprite_ext(sprite_index,image_index,x-1+lengthdir_x(1,dir),y-1+lengthdir_x(1,dir),image_xscale,image_yscale,image_angle,image_blend,0.1+lengthdir_x(0.1,dir))
    dir+=4
    }
else
    {
    draw_sprite_ext(sprite_index, 1, x, y,image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    }