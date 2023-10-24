function scrMaskAlignment(){
//this script does NOT include execution animations
with objPlayerAdrian
{
if weapon = "unarmed" {spriteCenter = 0} else {spriteCenter = -1}
if attacking = 0 {
		switch (floor(image_index)) {
		    case 0:
			case 4: maskPosMod = 0; break;
			case 1:
			case 2:
			case 3: maskPosMod = -image_yscale; break;
			case 5:
			case 6:
			case 7: maskPosMod = image_yscale; break;
		    default: break;
		}
	} else if attacking = 1 {
		switch (weapon) {
		    case "AK47":
			case "M16":
			case "MP5":
			case "Skorpion":
								switch (floor(image_index)) {
								case 0: maskPosMod = 1; break;
								case 1: maskPosMod = 0; break;
								} break;
			case "Pistol":
			case "Silencer":	switch (floor(image_index)) {
								case 0: maskPosMod = -1; break;
								case 1: maskPosMod = 0; break;
								} break;
			case "DoubleBarrel":
			case "Spas12":
								switch (floor(image_index)) {
								case 0:
								case 1:
								case 2: maskPosMod = -1; break;
								case 3: maskPosMod = 0; break;
								} break;
			case "Magnum":
								switch (floor(image_index)) {
								case 0:
								case 1: maskPosMod = -1; break;
								case 2: maskPosMod = 0; break;
								} break;
			case "Shotgun":		
								switch (floor(image_index)) {
								case 0:
								case 1: maskPosMod = -1; break;
								case 2:
								case 3:
								case 4:
								case 5:
								case 6:
								case 7:
								case 8:
								case 9:
								case 10:
								case 11:
								case 12: maskPosMod = 0; break;
								} break;
		    default: break;
		}
	}
}
	
with objPlayerSamuel
{
	if attacking = 0 {
		switch (floor(image_index)) {
		    case 0:
			case 4: maskPosMod = 0; break;
			case 1:
			case 2:
			case 3: maskPosMod = -image_yscale; break;
			case 5:
			case 6:
			case 7: maskPosMod = image_yscale; break;
		    default: break;
		}
	}
}
	
with objPlayerIosif
{
	if weapon = "unarmed" {spriteCenter = 0} else {spriteCenter = -1}
	if attacking = 0 {
		switch (floor(image_index)) {
		    case 0:
			case 4: maskPosMod = 0; break;
			case 1:
			case 2:
			case 3: maskPosMod = -image_yscale; break;
			case 5:
			case 6:
			case 7: maskPosMod = image_yscale; break;
		    default: break;
		}
	} else if attacking = 1 {
		switch (weapon) {
		    case "AK47":
								switch (floor(image_index)) {
								case 0: maskPosMod = 1; break;
								case 1: maskPosMod = 0; break;
								} break;
			case "Shotgun":
								switch (floor(image_index)) {
								case 0:
								case 1: maskPosMod = 1; break;
								case 2:
								case 3:
								case 4:
								case 5:
								case 6:
								case 7:
								case 8:
								case 9:
								case 10:
								case 11:
								case 12: maskPosMod = 0; break;
								} break;
		    default: break;
			}
		}
}
	
with objPlayerGriffin
{
	if attacking = 0 {
		switch (floor(image_index)) {
		    case 0:
			case 4: maskPosMod = 0; break;
			case 1:
			case 2:
			case 3: maskPosMod = -image_yscale; break;
			case 5:
			case 6:
			case 7: maskPosMod = image_yscale; break;
		    default: break;
		}
	}
}
	
	//etc.
	
	
	
}