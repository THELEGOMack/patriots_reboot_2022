function EOpenFire(){
//behavior


	var srcx = x;
	var srcy = y;
	var src = direction;
	var destx = objPlayer.x;
	var desty = objPlayer.y;
	var dest = point_direction( srcx, srcy, destx, desty );
	direction = angle_rotate( src, dest, max( 1, abs( angle_difference( dest, src ) ) * 0.1 ) );
	
	
	if (global.playerDead = false)
	{
		if (weapon = choose("Silencer", "M16", "AK47", "Shotgun"))
		{
			if (shootTimer <= 0) and (currentAmmo > 0)
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
		aggroTimer = 0;
		state = 6;
	}
}