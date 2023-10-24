switch (image_angle) {
    case 0: y+=5; break;
	case 90: x+=5; break;
	case 180:
	case -180: y+=5; image_yscale = -1; break;
	case 270:
	case -90: x+=5; image_yscale = -1; break;
    default: break;
}
event_inherited();