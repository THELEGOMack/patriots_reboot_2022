function scrDropShadowCast(sprIndex, imgIndex, imgAngle){
gpu_set_fog(true, global.shadowHue, 0, 1);
draw_sprite_ext(sprIndex, imgIndex, x+global.shadowDirX, y+global.shadowDirY, image_xscale, image_yscale, imgAngle, c_white, global.shadowAlpha);
gpu_set_fog(false, c_white, 0, 0);
}

//MID-DRAWING FUNCTION?