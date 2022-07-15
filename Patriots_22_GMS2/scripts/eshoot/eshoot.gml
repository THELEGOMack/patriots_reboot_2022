function EShoot(){
var shotX = 0;
var shotY = 0;
shotX = x + lengthdir_x(0, direction);
shotY = y + lengthdir_y(0, direction);
attacking = 1;
if shotgun = true
    {
    for(var i = 0; i < 6; i += random_range(0,2);)
        {
        var shot = instance_create_layer(shotX, shotY, "characters", objEBullet);
        shot.damage = 1;
        shot.speed = random_range(20*shotSpeed-1, 20*shotSpeed+1);
        shot.direction = direction + random_range(spread, -spread);
		shot.direction = direction;
        }
    }
    else {var shot = instance_create_layer(shotX, shotY, "characters", objEBullet);
    }
shot.speed = 20*shotSpeed;
shot.direction = direction + random_range(spread*0.75, -spread*0.75);
image_index = 0;
image_speed = 2;
sprite_index = asset_get_index(string_replace(sprite_get_name(sprite_index), "Walk", "Attack"));
audio_play_sound(sfx, 10, false)
shootTimer = shotDelay*1.2;
currentAmmo--;
attacking = 0;
}