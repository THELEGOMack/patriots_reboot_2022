//initialize
aimDir = 0;
hp = 1;

//speed values
speedWalk = 1; //leg spd: speedWalk*0.4
speedCreep = 0.6; //leg spd: speedCreep*0.5
speedRun = 2.3; //leg spd: speedRun*0.5

mask_index = sprEMask;
event_inherited();

/*
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

#region pathfinding
path = path_add();
//pathLOS = path_add();
xSpawnPos = x; //x spawn pos
ySpawnPos = y; //y spawn pos
pLastX = objSpawnPoint.x;
pLastY = objSpawnPoint.y;
#endregion