switch(sprite_index)
{
case sprMafiaWalkAK47:
case sprMafiaWalkAK47R: weapon = "AK47"; drop = sprAK47; ammo = 24; ammoEnemy = 24; break;
case sprMafiaWalkM16:
case sprMafiaWalkM16R: weapon = "M16"; drop = sprM16; ammo = 24; ammoEnemy = 24; break;
case sprMafiaWalkShotgun:
case sprMafiaWalkShotgunR: weapon = "Shotgun"; drop = sprShotgun; ammo = 6; ammoEnemy = 6; break;
case sprMafiaWalkSilencer:
case sprMafiaWalkSilencerR: weapon = "Silencer"; drop = sprSilencer; ammo = 12; ammoEnemy = 12; break;
default: break;
}

if (bullets = 1)
    {
    deathType = "dead_machinegun";
    //scrCreateCorpse();
    instance_destroy();
    }
else if (bullets > 1)
    {
    deathType = "dead_shotgun";
    //scrCreateCorpse();
    instance_destroy();
    }

legIndex += speed*0.1
legAngle = direction

if !place_free(x+lengthdir_x(8, direction), y+lengthdir_y(8, direction))
    {
    direction+=10
    }
else
    {
    if abs(frac(direction*(1/90)))>0 direction+=10
    }