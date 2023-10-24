image_speed = 0;

switch (idleAnim) {
	//replay animation with delay (value 1)
	case "AK47Check":
	case "beer":
	case "M16Check":		alarm[11] = 100 + random(200);	break;
	//value 2
	case "newspaper":		alarm[11] = 150 + random(200);	break;
	//immediately replay animation on loop
	case "club":
	//case sprMafiaIdlePee:
	case "phone":
	case "phoneSkorp":
	case "phoneSilencer":
	case "talking":
	case "washHands":		alarm[11] = 1;					break;
	//unique
	case "smoking":			alarm[11] = 100 + random(200);
									var _smoke = instance_create_depth(x, y, depth, objSmokePuff)
									_smoke.speed = 0.25;
									_smoke.image_speed = 1;
									_smoke.image_angle = lookDir - 4 + random(8);
									_smoke.direction = _smoke.image_angle;
									_smoke.image_alpha = 0.2;		break;
	//no animation
	case "sitting":
	case "standM16":
	default:														break;
}