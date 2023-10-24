event_inherited();

SaveState = function(buf)
{
buffer_write(buf, buffer_string, sprite_index);
buffer_write(buf, buffer_string, state);
buffer_write(buf, buffer_string, weapon);
buffer_write(buf, buffer_u8, startingAmmo);
buffer_write(buf, buffer_u8, hp);
buffer_write(buf, buffer_u8, bulletCount);
buffer_write(buf, buffer_u16, direction);
buffer_write(buf, buffer_u16, lookDir);
buffer_write(buf, buffer_u16, aimDir);
//etc.
}

LoadState = function(buf)
{
sprite_index = buffer_read(buf, buffer_string);
state = buffer_read(buf, buffer_string);
weapon = buffer_read(buf, buffer_string);
startingAmmo = buffer_read(buf, buffer_u8);
hp = buffer_read(buf, buffer_u8);
bulletCount = buffer_read(buf, buffer_u8);
direction = buffer_read(buf, buffer_u16);
lookDir = buffer_read(buf, buffer_u16);
aimDir = buffer_read(buf, buffer_u16);
//etc.
}

//speed values
speedWalk = 1; //leg spd: speedWalk*0.4
speedCreep = 0.6; //leg spd: speedCreep*0.5
speedRun = 2.3; //leg spd: speedRun*0.5

//aggro values
alerted = false;
seePlayer = false;
playerSpotted = false;
gunshotHeard = false;
aggroTimer = 0;
aggroLimit = 4;

//reaction time
rxnTime = 0.2;
turnSpeed = 0.2;

//organize below values?
sightMax = 140;
sightMin = 50;
hearingRange = 300;
shootTimer = 20;
searchTimer = 0;
visConeW = 120;
killZone = 20;
aimDir = direction; //aim (target) direction INDEPENDENT of movement direction

//pathfinding
path = path_add();
//pathLOS = path_add();
xSpawnPos = x; //x spawn pos
ySpawnPos = y; //y spawn pos
pLastX = objSpawnPoint.x;
pLastY = objSpawnPoint.y;

//state debug
lineColor = c_white;
pathCheckColor = c_white;
LOSCheckColor = c_white;