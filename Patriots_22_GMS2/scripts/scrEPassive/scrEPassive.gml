function scrEPassive(){
	lineColor = c_lime;
	if instance_exists(objPlayer)
	{
		if seePlayer = true {aggroTimer += rxnTime} else {aggroTimer -= (rxnTime*2)}
		if aggroTimer = aggroLimit {
			alerted = true;
			playerSpotted = true;
			}
	}
	if scrELOSCheck(objEnemyDead) = true {
		aggroTimer = 0;
		alerted = true;
		}
	if gunshotHeard = true {
		aggroTimer = 0;
		alerted = true;
		}
}