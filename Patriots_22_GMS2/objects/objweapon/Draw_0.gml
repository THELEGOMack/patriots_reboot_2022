//if ammo != 0
//    {
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprHalo, 0, x, y, 0.25, 0.25, 0, c_white, random_range(0.10, 0.12));
	gpu_set_blendmode(bm_normal);
	gpu_set_fog(true, global.shadowHue, 1, 0);
    draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,global.shadowAlpha);
	gpu_set_fog(false, c_white, 0, 0);
    draw_sprite_ext(sprite_index,0,x-1+lengthdir_x(1,dir),y-1+lengthdir_x(1,dir),image_xscale,image_yscale,image_angle,c_white,image_alpha);
	gpu_set_fog(true, c_white, 1, 0);
    draw_sprite_ext(sprite_index,0,x-1+lengthdir_x(1,dir),y-1+lengthdir_x(1,dir),image_xscale,image_yscale,image_angle,c_white,0.1+lengthdir_x(0.1,dir));
	gpu_set_fog(false, c_white, 0, 0);
    dir+=4;
	
	draw_set_font(fntPlaceholder);
    var text_1 = "ammo: " + string(ammo);
    draw_text_transformed_color(x+10, y-4, text_1, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
	
//    }
/*else
    {
    draw_sprite_ext(sprite_index, 1, x, y,image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    }