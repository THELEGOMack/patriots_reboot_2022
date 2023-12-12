switch(state)
{
	case 0: if leftSide = true {doorRotL += doorSpd} else {doorRotR -= doorSpd}; break; //closing
	case 1: if leftSide = true {doorRotL -= doorSpd} else {doorRotR += doorSpd}; break; //opening
	default: break;
}

//audio flags
	
doorRotL = clamp(doorRotL, -70, 0);
doorRotR = clamp(doorRotR, 0, 70);

if active = true {
	if instance_exists(objPlayer){
		if point_distance(x, y, objPlayer.x, objPlayer.y) <= doorRadius {state = 1} else {state = 0}
	}
} else exit