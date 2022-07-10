if objPlayer.canLook = true
{
	x = objPlayer.x + lengthdir_x(distance_to_point(objCursor.x, objCursor.y), objPlayer.lookDir)/viewDist;
	y = objPlayer.y + lengthdir_y(distance_to_point(objCursor.x, objCursor.y), objPlayer.lookDir)/viewDist;
	clamp(x, 0, 28)
	clamp(y, 0, 28)
}