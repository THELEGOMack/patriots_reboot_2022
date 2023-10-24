if (active = true)
{
//fade out
//check player walking direction
	room_goto(targetRoom);
	objPlayer.x = targetX;
	objPlayer.y = targetY;
//get relative cursor coordinates
} else exit