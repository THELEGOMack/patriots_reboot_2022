if scrCheckFloorClear() = false {state = 0} else {state = 1}

image_index = clamp(image_index, 0, 16);

switch(state)
{
	case 0: //close
		image_index -= 0.4;
		if image_index <= 0 {image_index = 0}
		break;
	case 1: //open
		image_index += 0.4;
		if image_index >= 16 {image_index = 16}
		break;
	default: break;
}

if (image_index = 0) and (doneClose = 0) {alarm[1] = 1}
if (image_index = 16) and (doneOpen = 0) {alarm[0] = 1}

if doneOpen = true {imgSpd += 0.5;} else {imgSpd = 0;}
bobAmt = Wave(4, -4, 2, 0)