//head tracking
switch (objPlayer.image_index)
{
	case 0: y = 0; break;
	case 1:
	case 2:
	case 3: y = 1; break;
	case 4: y = 0; break;
	case 5:
	case 6:
	case 7: y = -1; break;
	default: break;
}