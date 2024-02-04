function scrEAttackGun(){ //THIS SCRIPT NEEDS CLEANING
	function attackGun(mf_type, mf_xscale, mf_yscale, mf_alpha)
	{
	var shotX = x + lengthdir_x(barrelLength, lookDir) + lengthdir_x(barrelHeight, lookDir + 90);
	var shotY = y + lengthdir_y(barrelLength, lookDir) + lengthdir_y(barrelHeight, lookDir + 90);
	var mf = instance_create_depth(shotX, shotY, depth, mf_type);
	mf.image_xscale = mf_xscale;
	mf.image_yscale = mf_yscale;
	mf.image_alpha = mf_alpha;
	mf.direction = direction;

	var bullet = instance_create_depth(x, y, depth, objEBullet);
	bullet.speed = 20;
	bullet.direction = lookDir + random_range(spread, -spread);
	if (weapon = "Shotgun") or (weapon = "DoubleBarrel") or (weapon = "Spas12") or (weapon = "Baikal")
	{
		for(var i = 0; i < 6; i += random_range(0,2);)
        {
        var shot = instance_create_depth(x, y, depth, objEBullet);
        shot.speed = random_range(20*shotSpeed-1, 20*shotSpeed+1);
        shot.direction = lookDir + random_range(spread, -spread);
        }
	}
	currentAmmo--;
	if silenced = false {global.gunshotHeard = true;}
	
	if shellToggle = true{
	var _shellSpawn = function() {
		var _shellInst = instance_create_layer(x + lengthdir_x(shellSource, lookDir), y + lengthdir_y(shellSource, lookDir), "body_layer", objShell);
		_shellInst.direction = lookDir + 90;
		switch(weapon)
	    {
		    case "Shotgun":
			case "Baikal":
			case "Spas12":	 _shellInst.image_index = 0; _shellInst.direction += 180;		break;
	
		    case "AK47":
		    case "M16":      _shellInst.image_index = 1; _shellInst.direction += 180;		break;
	
		    case "MP5":      _shellInst.image_index = 2;
							 with objPlayerAdrian {_shellInst.direction += 0;}
							 with !objPlayerAdrian {_shellInst.direction = random(360);}
							 _shellInst.speed = random_range(3, 6);							break;
					 
			case "Skorpion":  _shellInst.image_index = 2;
							 with objPlayerAdrian {_shellInst.direction = random(360);
												   _shellInst.speed = random_range(3, 6)}
							 with !objPlayerAdrian {_shellInst.direction += 0;}				break;
	
			case "Pistol":					
		    case "Silencer": _shellInst.image_index = 2;
							with objPlayerAdrian {_shellInst.speed = random_range(3,5)}
							with !objPlayerAdrian {_shellInst.speed = random_range(5, 9)}	break;
					
		    default:																		break;
	    }
	_shellInst.direction += random_range(-10, 10);
	}
	//call_later(shellWait, time_source_units_frames, _shellSpawn, false); //use a time source instead?
	}
	}

switch (weapon) {
    case "AK47":
    case "M16":			attackGun(objMuzzleFlashRifle,random_range(0.70, 1.30),random_range(0.8, 1.2), random_range(0.95, 1.05));	break;				
	case "Magnum":		attackGun(objMuzzleFlash9mm,random_range(0.75, 1.25),random_range(1.2, 1.4),random_range(0.95, 1.05));		break;
	case "Silencer":	attackGun(objMuzzleFlash9mm,random_range(0.75, 1.25),random_range(0.9, 1.1),random_range(0.05, 0.2));		break;			
	case "Pistol":
	case "Skorpion":
	case "MP5":			attackGun(objMuzzleFlash9mm,random_range(0.75, 1.25),random_range(0.9, 1.1),random_range(0.95, 1.05));		break;			
	case "DoubleBarrel":
	case "Spas12":
	case "Baikal":
	case "Shotgun":		attackGun(objMuzzleFlashShotgun,random_range(0.95, 1.05),random_range(0.95, 1.05),1);						break;
    default:			break;
}
sprite_index = asset_get_index(string_replace(sprite_get_name(sprite_index), "Walk", "Attack"));
attacking = 1;
image_index = 0;
image_speed = 1;
audio_play_sound(sfx, 10, false);
shootTimer = shotDelay;
alarm[3] = shotDelay;
exit;
}