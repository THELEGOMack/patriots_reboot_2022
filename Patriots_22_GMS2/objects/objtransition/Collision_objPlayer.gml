if (active = true)
{
	room_goto(targetRoom);
	objPlayer.x = targetX;
	objPlayer.y = targetY;
	objPlayer.layer = targetLayer;
} else exit