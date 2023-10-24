///@desc mask alignment
switch (floor(image_index)) {
    case 0:
	case 1:
	case 11: maskPosMod = 0; break;
	case 2:
	case 3:
	case 4:
	case 5: maskPosMod = 1; break;
    case 6:
	case 7:
	case 8:
	case 9:
	case 10: maskPosMod = -1; break;
	default: break;
}