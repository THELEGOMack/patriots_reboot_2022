function Shoot(){
var shotX = 0;
var shotY = 0;
shotX = x + lengthdir_x(0, lookDir);
shotY = y + lengthdir_y(0, lookDir);
attacking = 1;
if shotgun = true
    {
    for(var i = 0; i < 6; i += random_range(0,2);)
        {
        var shot = instance_create_layer(shotX, shotY, "characters", objBullet);
        shot.damage = damage;
        shot.speed = random_range(20*shotSpeed-1, 20*shotSpeed+1);
        shot.direction = lookDir + random_range(spread, -spread);
        }
    }
    else {var shot = instance_create_layer(shotX, shotY, "characters", objBullet);
    }
shot.damage = damage;
shot.speed = 20*shotSpeed;
shot.direction = lookDir + random_range(spread, -spread);
image_index = 0;
image_speed = 1;
sprite_index = asset_get_index(string_replace(sprite_get_name(sprite_index), "Walk", "Attack"));
audio_play_sound(sfx, 10, false)
shootTimer = shotDelay;
ammoPlayer--;

if (weapon = "Shotgun"){
  shellTimer = 30;
}else{shellTimer = 1;}
if (shellToggle = 1)
    {
    alarm[0] = shellTimer;
    }
}