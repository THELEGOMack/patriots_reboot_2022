depth = -10000
image_speed = 0.5

fadeAlpha = 1;
xInit = objSpawnPoint.x + lengthdir_x(32, objSpawnPoint.image_angle)
yInit = objSpawnPoint.y + lengthdir_y(32, objSpawnPoint.image_angle)
x = xInit;
y = yInit;

//movement
mX1 = x;
mY1 = y;
mX2 = x;
mY2 = y;
len = 0;
dir = 0;

pBlockX = 1;
pBlockY = 1;

//camera movement
camViewMod = 2; //base this on camera zoom values?

//"fade in" transition between rooms
var _fadeIn = function() {fadeAlpha -= 0.05;}
_time_source = time_source_create(time_source_global, 0.1, time_source_units_frames, _fadeIn, [], 20);
if fadeAlpha > 0 {alarm[0] = 30;}  //note that this procs on creation of the object (e.g. at the start of a new level)
else if fadeAlpha <= 0 {time_source_destroy(_time_source);}

//MUSIC CONTROLS
switch (room) { //super primitive, make a proper script instead!
    case rmAdrianPenthouse2:	audio_play_sound(musVClub, 1000, true);			break;
	case rmLaundry:				audio_play_sound(musTheWatch, 1000, true);		break;
	case rmMania_int_F1:		audio_play_sound(musTerminal, 1000, true);		break;
	case rmVegasMeth1:			audio_play_sound(musGarbageDay, 1000, true);	break;
	case rmSamGarage:															break;
	case rmVetGarage:																break;
    default:																	break;
}