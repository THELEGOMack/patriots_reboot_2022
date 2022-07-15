if hp <= 0
{
	instance_destroy();
	var corpse = instance_create_layer(x, y, "FurnitureFloor", objMafiaDeadMachineGun);
	corpse.image_angle = image_angle;
	corpse.direction = image_angle;
}

shootTimer--;
if shootTimer < -200
{
	shootTimer = -1
}

aggroTimer = clamp(aggroTimer, 0, rxnTime);
alertTimer = clamp(alertTimer, 0, 20);

//state machine
switch(state)
{
	#region idle
	case 0:
	stateTXT = "idle"

	//behavior

	//transition trigger(s)
	if ((point_distance(x, y, objPlayer.x, objPlayer.y) < sightDistance) and (!collision_line(x, y, objPlayer.x, objPlayer.y, objSolidWall, false, false)))
	{
		//account for reaction time!
		state = 3;
	}
	
	break;
	#endregion
	
	#region patrol
	case 1:
	//behavior
		
	//transition trigger(s)
	break;
	#endregion
	
	#region wander
	case 2:
	//behavior
		
	//transition trigger(s)
	break;
	#endregion
	
	#region alert
	case 3:
	stateTXT = "alert"
	
	//behavior
		direction = lerp(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 0.2);
		
	//transition trigger(s)
	if ((point_distance(x, y, objPlayer.x, objPlayer.y) < sightDistance) and (!collision_line(x, y, objPlayer.x, objPlayer.y, objSolidWall, false, false)))
	{
		if (objPlayer.pCorpse = 1)
		{
			state = 6;
		}
		else
		{
			state = 7;
		}
	}
	else
	{
		state = 5;
	}

	//set sprite
	switch(sprite_index)
	{
		//idle AK sprite(s) go here
		case sprMafiaWalkAK47R: sprite_index = sprMafiaWalkAK47; break;
		case sprMafiaIdleM16:
		case sprMafiaWalkM16R: sprite_index = sprMafiaWalkM16; break;
		case sprMafiaWalkShotgunR: sprite_index = sprMafiaWalkShotgun; break;
		case sprMafiaWalkSilencerR:
		case sprMafiaIdlePhoneSilencer:sprite_index = sprMafiaWalkSilencer; break;
		default: break;
	}
	#endregion
	
	#region searching
	case 5:
	stateTXT = "searching"
	
	//behavior
	if ((point_distance(x, y, objPlayer.x, objPlayer.y) < sightDistance) and (!collision_line(x, y, objPlayer.x, objPlayer.y, objSolidWall, false, false)))
	{
		state = 6;
	}
	else
	{
		exit; //chase
	}
	
	//transition trigger(s)
	break;
	#endregion
	
	#region shooting
	case 6:
	stateTXT = "shooting"
	
	//behavior
	direction = lerp(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 0.2);
	if (objPlayer.pCorpse = 0)
	{
		if (weapon = choose("Silencer", "M16", "AK47", "Shotgun"))
		{
			if (abs(angle_difference(direction, point_direction(x, y, objPlayer.x, objPlayer.y)) < 45))
			{
				if (shootTimer <= 0) and (currentAmmo > 0)
				{
					EShoot();
				}
			}
		}
	}
	else if (objPlayer.pCorpse = 1)
	{
		state = 7;
	}
	//transition trigger(s)
	
	#endregion
	
	#region player dead
	case 7:
	stateTXT = "player dead"
	//behavior
		//coin toss: random, wander, or stay still
	break;
	#endregion
}