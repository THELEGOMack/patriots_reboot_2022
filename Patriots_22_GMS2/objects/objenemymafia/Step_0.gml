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
alertTimer = clamp(alertTimer, 0, rxnTime);
seePlayer = ((point_distance(x, y, objPlayer.x, objPlayer.y) < sightDistance) and (!collision_line(x, y, objPlayer.x, objPlayer.y, objSolidWall, false, false)))

if global.playerDead = true
{
	state = 6; //this should be the only way "player death" state can be active...
}

//state machine
switch(state)
{
	#region idle/unresponsive
	case 0:
	stateTXT = "idle"

	//transition trigger(s)
	if seePlayer = true
	{
		alertTimer++;
		if alertTimer >= rxnTime
		{
			state = 3;
		}
	}
	else
	{
		aggroTimer--;
		alertTimer--;
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
	
	#region alert/armed
	case 3:
	stateTXT = "alert"
	
	//behavior
	aggroTimer++;
	if seePlayer = true
	{
		direction = lerp(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 0.2);
	}
	
	//transition trigger(s)
	if seePlayer = true
	{
		if (abs(angle_difference(direction, point_direction(x, y, objPlayer.x, objPlayer.y)) < 15))
		{
			if (aggroTimer >= rxnTime)
			{
				state = 4;
			}
			else if (aggroTimer < rxnTime)
			{
				exit;
			}
		}
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
	break;
	#endregion
	
	#region searching/aiming
	case 4:
	stateTXT = "searching"
	
	//behavior
		//if in range, turn to player
		//else
			//get player's last known position
			//go to player's last known position
			//return to ALERT state
	
	//transition trigger(s)
	if seePlayer = true
	{
		if (abs(angle_difference(direction, point_direction(x, y, objPlayer.x, objPlayer.y)) < 15))
		state = 5;
	}
	else
	{
		aggroTimer *= 0.97;
		state = 3;
	}
	
	break;
	#endregion
	
	#region shooting
	case 5:
	
	//behavior
	direction = lerp(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 0.5);
	if (global.playerDead = false)
	{
		if (weapon = choose("Silencer", "M16", "AK47", "Shotgun"))
		{
			if (shootTimer <= 0) and (currentAmmo > 0) //and (global.playerDead = false)
			{
				stateTXT = "shooting"
				EShoot();
				state = 4;
			}
		}
	}
	//transition trigger(s)
	if seePlayer = false
	{
		state = 4;
	}
	
	break;
	#endregion
	
	#region player dead
	case 6:
	stateTXT = "player dead"
	//behavior
		//coin toss: random, wander, or stay still
	break;
	#endregion
	
	//more states, etc.
	
	default: break;
}