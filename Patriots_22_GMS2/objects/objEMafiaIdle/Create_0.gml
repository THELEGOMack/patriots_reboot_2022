dropped = 0;
image_speed = 0;
state = "idle";

switch (idleAnim) {
	case "phone": spriteSet = sprMafiaIdlePhone; itemDrop = 0; weapon = choose("Silencer", "Skorpion"); break;
	case "phoneSkorp": spriteSet = sprMafiaIdlePhoneSkorp; itemDrop = 0; weapon = "Skorpion"; break;
	case "phoneSilencer": spriteSet = sprMafiaIdlePhoneSilencer; itemDrop = 0; weapon = "Silencer"; break;
	//case "beer": break; //drop bottle weapon? shatter glass?
	//case "newspaper": itemDrop = choose(1, 2); break;
	//case "talking":
	//case "washHands":
	//case "sitting":
	case "club": spriteSet = sprMafiaIdleClub; itemDrop = noone; weapon = "Club"; break;
	case "smoking": spriteSet = sprMafiaIdleSmoke; itemDrop = 3; weapon = choose("Silencer", "Skorpion", "M16", "AK47", "Shotgun", "DoubleBarrel"); break;
	case "M16Check": spriteSet = sprMafiaIdleM16Check; itemDrop = noone; weapon = "M16"; break;
	case "standM16": spriteSet = sprMafiaIdleM16; itemDrop = noone; weapon = "M16"; break;
	case "AK47Check": spriteSet = sprMafiaIdleAK47Check; itemDrop = noone; weapon = "AK47"; break;
    default: itemDrop = noone; weapon = "unarmed"; break;
}

event_inherited();
spriteSwitch = sprite_index;
sprite_index = spriteSet;
alarm[11] = random(200);