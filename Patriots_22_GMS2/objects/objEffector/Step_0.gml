if instance_exists(objPlayer)
{
	if objPlayer.canLook = true {
	//apply mouse vector
	mX1 = display_get_width()/2;
	mY1 = display_get_height()/2;
	mX2 = display_mouse_get_x();
	mY2 = display_mouse_get_y();
	len = point_distance(mX1, mY1, mX2, mY2);
	dir = point_direction(mX1, mY1, mX2, mY2);
	
	x += lengthdir_x(len, dir) + objCursorBox.xMovement;
	y += lengthdir_y(len, dir) + objCursorBox.yMovement;
	x = clamp(x, objCursorBox.x, objCursorBox.x + objCursorBox.image_xscale);
	y = clamp(y, objCursorBox.y, objCursorBox.y + objCursorBox.image_yscale);
	
	if (objPlayer.weapon = "Shotgun") or (objPlayer.weapon = "DoubleBarrel") or (objPlayer.weapon = "Spas12") or (objPlayer.weapon = "Baikal") {sprite_index = sprCursorShotgun}
	else {sprite_index = sprCursor}
	
	}
	else {sprite_index = noone;}
} else {sprite_index = noone;}

//dip-to-black states
switch(dtbFlag)
{
	case 0: //0% opacity
		fadeAlpha -= 0.05;
		if fadeAlpha <= 0 {fadeAlpha = 0}
		break;
	case 1: //100% opacity
		fadeAlpha += 0.05;
		if fadeAlpha >= 1 {fadeAlpha = 1}
		break;
	default: break;
}