function scrDrawPickup(){
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprHalo, 0, x, y, 0.25, 0.25, 0, c_white, random_range(0.10, 0.12));
	gpu_set_blendmode(bm_normal);
	gpu_set_fog(true, global.shadowHue, 1, 0);
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,global.shadowAlpha);
	gpu_set_fog(false, c_white, 0, 0);
	draw_sprite_ext(sprite_index,0,x-1+lengthdir_x(1,bob),y-1+lengthdir_x(1,bob),image_xscale,image_yscale,image_angle,c_white,image_alpha);
	gpu_set_fog(true, c_white, 1, 0);
	draw_sprite_ext(sprite_index,0,x-1+lengthdir_x(1,bob),y-1+lengthdir_x(1,bob),image_xscale,image_yscale,image_angle,c_white,0.1+lengthdir_x(0.1,bob));
	gpu_set_fog(false, c_white, 0, 0);
	bob+=4;
}