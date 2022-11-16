function EPatrol(){
stateTXT = "patrol"
//behavior
	event_inherited();
	legIndex += speed*0.1
	legAngle = direction
	speed = 1;
//transition trigger(s)
	if seePlayer = true
	{
		alertTimer++;
		if alertTimer >= rxnTime*2
		{
			speed = 0;
			state = 3;
		}
	}
	else
	{
	aggroTimer--;
	alertTimer--;
	}
	
	if (global.gunshotHeard = 1)
	{
		state = 3;
	}
	if (seeCorpse = true)
	{
		//turn towards NEWEST corpse?
		state = 3;
	}
}