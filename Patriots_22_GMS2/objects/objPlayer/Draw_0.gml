if (keyUp or keyDown or keyRight or keyLeft) and (canMove = true)
{
    scrDropShadowCast(legs, legIndex, move_axis);
    draw_sprite_ext(legs, legIndex, x, y, abs(image_xscale), abs(image_yscale), move_axis, c_white, image_alpha);
}

event_inherited();

//mask drawing
if mask != noone
{
	draw_sprite_ext(objPlayer.mask, maskIndexMod, x + lengthdir_x(spriteCenter, lookDir) + lengthdir_x(maskPosMod, lookDir+90), y + lengthdir_y(spriteCenter, lookDir) + lengthdir_y(maskPosMod, lookDir+90), image_xscale, image_yscale, lookDir, c_white, image_alpha)
}

//weapon spread cone
if canShoot = true {
	draw_set_alpha(0.25);
	var getLineAboveX = x + lengthdir_x(64, lookDir-spread);
	var getLineAboveY = y + lengthdir_y(64, lookDir-spread);
	var getLineBelowX = x + lengthdir_x(64, lookDir+spread);
	var getLineBelowY = y + lengthdir_y(64, lookDir+spread);
	draw_line_width_color(x, y, getLineAboveX, getLineAboveY, 0.5, c_white, c_white);
	draw_line_width_color(x, y, getLineBelowX, getLineBelowY, 0.5, c_white, c_white);
	draw_set_alpha(1);
}