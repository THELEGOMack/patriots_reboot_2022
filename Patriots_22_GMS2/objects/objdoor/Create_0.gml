switch(image_angle)
	{
	case 0: y += 4; break;
	case -90:
	case 270: x += 4; break;
	case 180: y += 4; image_yscale = -1; break;
	case 90: x += 4; image_yscale = -1; break;
	}