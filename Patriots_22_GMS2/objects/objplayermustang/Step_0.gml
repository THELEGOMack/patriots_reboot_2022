/*//when level is clear
if (point_distance(x, y, objPlayer.x, objPlayer.y) < 128)
{
	//play open audio
	_door.image_angle = approach(_doorRotInit - 45, _doorRotInit, 1);
}
else
{
	_door.image_angle = approach(_doorRotInit, _doorRotInit - 45, 1);
	//audio?
}