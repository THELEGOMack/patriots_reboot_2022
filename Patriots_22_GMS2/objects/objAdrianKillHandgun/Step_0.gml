///@desc mask alignment
switch (floor(image_index)) {
    case 0: maskPosMod = 0; spriteCenter = 6; maskIndexMod = 0; break; //initalize
	case 1:
	case 2: spriteCenter = 8; break;
	case 3: maskIndexMod = 3; spriteCenter = 6; break;
	case 4:
	case 5:
	case 6:
	case 7:
	case 8:
	case 9: maskPosMod = 0; break;
	case 10: maskPosMod = -1; break;
	case 11: maskPosMod = 0; break;
	default: break;
}