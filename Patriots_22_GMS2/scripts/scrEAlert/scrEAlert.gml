function scrEAlert(){
	lineColor = c_yellow
	if instance_exists(objPlayer)
	{
		if seePlayer = true {aggroTimer += rxnTime} else {aggroTimer -= (rxnTime*2)}
		if aggroTimer = aggroLimit {playerSpotted = true}
	}
}