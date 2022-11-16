function EEngage(){
stateTXT = "engage"
	//behavior
		//weapon check
		if seePlayer = true
		{
			if (weapon = choose("Silencer", "M16", "AK47", "Shotgun"))
			{
				if (abs(angle_difference(direction, point_direction(x, y, objPlayer.x, objPlayer.y)) < 15))
				{
					state = 5;
				}
			}
			else if (weapon = choose("Club" /*more melee*/))
			{
				if (distance_to_object(objPlayer) >= 20)
				{
					state = 6;
				}
				else
				{
					state = 10;
				}
			}
			else if weapon = noone
			{
				state = 8;
			}
		}
		else if (seePlayer = false)
		{
			aggroTimer = 0;
			state = 6;
		}
}