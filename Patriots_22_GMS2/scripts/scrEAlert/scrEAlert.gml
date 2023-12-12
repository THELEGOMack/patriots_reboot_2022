function scrEAlert(){
	lineColor = c_yellow
	if instance_exists(objPlayer)
	{
		if seePlayer = true {aggroTimer += rxnTime*2} else {aggroTimer -= (rxnTime)}
		if aggroTimer = aggroLimit {playerSpotted = true}
	}
}