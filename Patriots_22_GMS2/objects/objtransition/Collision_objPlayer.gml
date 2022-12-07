if (active = true)
{
//fade out
//check direction
	room_goto(targetRoom);
	objPlayer.x = targetX;
	objPlayer.y = targetY;
	objPlayer.layer = targetLayer;
} else exit