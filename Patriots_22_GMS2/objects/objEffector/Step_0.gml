if instance_exists(objPlayer)
{
	if (objPlayer.weapon = "Shotgun") or (objPlayer.weapon = "DoubleBarrel") {sprite_index = sprCursorShotgun}
	else {sprite_index = sprCursor}

	//x = xInit; //these should be made independent from one another; game logic should follow the OBJECT rather than the mouse itself
	//y = yInit;
	x = mouse_x;
	y = mouse_y; //just running with this for now
	//cursor must move with the player! it seems to move correctly, but with a delay...

	clamp(distance_to_object(objPlayer), 1, global.viewDistance) //broken?
}

if objPlayer.canLook = false
{
	visible = false;
} else visible = true;