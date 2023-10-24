if hp <= 0 {state = "dead"}

switch (state) {
    case "static": scrEStateStatic(); break;
    case "patrol": scrEStatePatrol(); break;
    case "random": break;
	case "aiming": break;
	//aiming? "static" but firing?
    case "pathing": scrEPathingState(); break;
    case "search": break;
    case "dead": scrEDead(); break;
    default: break;
}

//don't make the "passive" and "alert" into seperate states, just have a boolean value for "alerted" that determines reaction time, walking sprite, etc
//perhaps the state can refer to movement behavior and transition into chasing/etc.

scrELOSCheck(objPlayer);
if scrELOSCheck(objPlayer) = true {
	LOSCheckColor = c_lime;
	seePlayer = true;
	scrEPathUpdate();
	} else {
		LOSCheckColor = c_red;
		seePlayer = false;
		}

scrELOSCheck(objEnemyDead);
scrEStraightPathCheck(objPlayer);
if scrEStraightPathCheck(objPlayer) = true {pathCheckColor = c_lime} else {pathCheckColor = c_red}

if alerted = true {scrEAlert()} else {scrEPassive()}
if playerSpotted = true {scrEAggro()}

if (aggroTimer <= 0) {aggroTimer = 0}
if (aggroTimer >= aggroLimit) {aggroTimer = aggroLimit}

if shootTimer <= 0 {shootTimer = 0}
if shootTimer >= shotDelay {shootTimer = shotDelay}