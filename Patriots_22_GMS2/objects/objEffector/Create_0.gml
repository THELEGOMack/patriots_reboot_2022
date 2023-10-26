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