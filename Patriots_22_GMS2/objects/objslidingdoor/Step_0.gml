switch(state)
{
	case 0: image_index ++; break; //opening
	case 1: image_index --; break; //closing
	default: break;
}

//audio flag
	
image_index = clamp(image_index, 0, 15)

if locked = false {
	if instance_exists(objPlayer){
		if point_distance(x, y, objPlayer.x, objPlayer.y) <= 60 {state = 0} else {state = 1}
	}
} else {state = 1; exit}