if instance_exists(objPlayer)
{
	if (objPlayer.weapon = "Shotgun") {sprite_index = sprCursorShotgun}
	else {sprite_index = sprCursor}

	x = mouse_x //these should be made independent from one another; game logic should follow the OBJECT rather than the mouse itself
	y = mouse_y

	clamp(distance_to_object(objPlayer), 1, global.viewDistance)
}

if objPlayer.canLook = false
{
	visible = false;
} else visible = true;