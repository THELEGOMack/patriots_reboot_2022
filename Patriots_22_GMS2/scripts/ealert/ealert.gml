function EAlert(){
stateTXT = "alert"
	
	//behavior
	if seePlayer = true
	{
		//continue "idle" behavior (e.g., patrol, static, wander)
		aggroTimer++;
	}
	
	//transition trigger(s)
	if (seePlayer = true) and (aggroTimer >= rxnTime)
	{
		//direction = lerp(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 0.2);
		
		
		var srcx = x;
		var srcy = y;
		var src = direction;
		var destx = objPlayer.x;
		var desty = objPlayer.y;
		var dest = point_direction( srcx, srcy, destx, desty );
		direction = angle_rotate( src, dest, max( 1, abs( angle_difference( dest, src ) ) * 0.1 ) );
		
		
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
		case sprMafiaWalkClubR:
		case sprMafiaIdleClub: sprite_index = sprMafiaWalkClub; break;
		default: break;
	}
}