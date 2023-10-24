///@desc mask alignment
switch (floor(image_index)) {
    case 0: maskPosMod = 0; spriteCenter = -10; maskIndexMod = 0; break; //initalize
	case 1:
	case 2: maskPosMod = 0; break;
	case 3: maskPosMod = -1; break;
	case 4:
	case 5: maskPosMod = 2; break;
	case 6: maskPosMod = 1; break;
	case 7: maskPosMod = 0; break;
	default: break;
}