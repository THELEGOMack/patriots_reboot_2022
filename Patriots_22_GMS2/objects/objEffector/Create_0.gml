depth = -10000
image_speed = 0.5

fadeAlpha = 1; //THIS DOES NOT COVER THE SCREEN IF THE CAMERA IS UNLOCKED
dtbFlag = 0;
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