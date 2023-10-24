//draw halo BUT without shadow
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprHalo, 0, x, y, 0.5, 0.5, 0, c_white, random_range(0.10, 0.12));
gpu_set_blendmode(bm_normal);
draw_self();

if objPlayer.mask != noone{
	draw_sprite_ext(objPlayer.mask, maskIndexMod, x + lengthdir_x(spriteCenter, image_angle) + lengthdir_x(maskPosMod, image_angle+90), y + lengthdir_y(spriteCenter, image_angle) + lengthdir_y(maskPosMod, image_angle+90), image_xscale, image_yscale, image_angle, c_white, image_alpha)
}