if halo = true{
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprHalo, 0, x, y, 0.5, 0.5, 0, c_white, random_range(0.15, 0.2));
gpu_set_blendmode(bm_normal);}
if speed >= 0.05
    {
	gpu_set_fog(true, global.shadowHue, 0, 1);
	draw_sprite_ext(legs, legIndex, x+global.shadowDirX, y+global.shadowDirY, abs(image_xscale), abs(image_yscale), legAngle, c_white, global.shadowAlpha);
	gpu_set_fog(false, c_white, 0, 0);
    draw_sprite_ext(legs, legIndex, x, y, abs(image_xscale), abs(image_yscale), legAngle, c_white, image_alpha);
    }
scrDropShadowCast(sprite_index, image_index, lookDir);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, lookDir, c_white, image_alpha);