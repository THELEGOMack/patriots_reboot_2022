if hp <= 0
{
	instance_destroy();
	var corpse = instance_create_layer(x, y, "body_layer", objMafiaDeadMachineGun);
	corpse.image_angle = image_angle;
	corpse.direction = image_angle;
}

if (speed != 0) and (attacking != 1)
{
	image_speed = speed;
}

if (speed !=0)
{
	if !place_free(x+lengthdir_x(8, direction), y+lengthdir_y(8, direction))
    {
		direction+=10
    }
	else
    {
		if abs(frac(direction*(1/90)))>0 direction+=10
    }
}

shootTimer--;
if shootTimer < -200
{
	shootTimer = -1
}

aggroTimer = clamp(aggroTimer, 0, rxnTime*2);
alertTimer = clamp(alertTimer, 0, rxnTime*2);
if instance_exists(objPlayer)
{
	seePlayer = ((point_distance(x, y, objPlayer.x, objPlayer.y) < sightDistance) and (!collision_line(x, y, objPlayer.x, objPlayer.y, objLOSBlocker, false, false)))
}
if instance_exists(objEnemyDead)
{
	seeCorpse = ((point_distance(x, y, objEnemyDead.x, objEnemyDead.y) < sightDistance) and (!collision_line(x, y, objEnemyDead.x, objEnemyDead.y, objLOSBlocker, false, false)))
}

if global.playerDead = true
{
	state = 7;
}

//state machine
switch(state)
{
	case 0: EStatic(); break;
	case 1: EPatrol(); break;
	case 2:	EWander(); break;
	case 3: EAlert(); break;
	case 4: EEngage(); break;
	case 5: EOpenFire(); break;
	case 6: EPursuit(); break;
	case 7: stateTXT = "player dead"; state = choose(0, 1, 2); break;
	case 8: ELookForWeapon(); break;
	case 9: ESearch(); break;
	case 10: ESwing(); break;
	//more states
	default: stateTXT = "null"; break;
}