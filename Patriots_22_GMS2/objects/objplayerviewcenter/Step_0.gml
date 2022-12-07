if instance_exists(objPlayer)
{
if objPlayer.canLook = true
	{
		x = objPlayer.x + lengthdir_x(distance_to_point(objEffector.x, objEffector.y), objPlayer.lookDir)/viewDist; //NEEDS A NEW EQUATION! VERY JITTERY. ROUND?
		y = objPlayer.y + lengthdir_y(distance_to_point(objEffector.x, objEffector.y), objPlayer.lookDir)/viewDist;
		//clamp(x, 0, 28)
		//clamp(y, 0, 28)
		
		if (keyboard_check(vk_shift))
		{
		//x = objPlayer.x + lengthdir_x(distance_to_point(objEffector.x, objEffector.y), objPlayer.lookDir); //this is a bootleg "free cam" mode tho
		//y = objPlayer.y + lengthdir_y(distance_to_point(objEffector.x, objEffector.y), objPlayer.lookDir);
		//viewDist = 1.1;
		} //else viewDist = 8;
	}
} else {exit}