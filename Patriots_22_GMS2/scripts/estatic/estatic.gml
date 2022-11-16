function EStatic(){
	stateTXT = "static"

	//transition trigger(s)
	if seePlayer = true
	{
		alertTimer++;
		if alertTimer >= rxnTime*2
		{
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
		//turn towards NEWEST corpse
		state = 3;
	}
}