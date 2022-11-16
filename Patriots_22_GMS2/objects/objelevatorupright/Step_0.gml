switch(state)
{
	case 0: //open
		if image_index != 0
		{
			approach(image_index, 0, 1);
		}
		break;
	case 1: //closed
		if image_index != -1
		{
			approach(image_index, -1, 1);
		}
		break;
	default: break;
}