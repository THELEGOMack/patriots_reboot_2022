image_blend = merge_color(c_orange,c_white,random(0.5));
direction = image_angle;

//light flash (WIP)
//screen shake

/*
//RIFLE
for(var i = 0; i < 3; i += random_range(0,2);)
        {
        var spark = instance_create_depth(x, y, depth, objMuzzleSpark);
        spark.speed = random_range(5, 10);
        spark.direction = direction + random_range(sparkFan, -sparkFan);
        }

var smoke = instance_create_depth(x, y, depth, objGunSmoke);
smoke.direction = direction;
smoke.speed = random_range(0.2, 0.4);
smoke.smokeScale = random_range(0.75, 1);
smoke.smokeAlpha = random_range(0.35, 0.6);

//SHOTGUN
/*
for(var i = 0; i < 6; i += random_range(0,2);)
        {
        var shot = instance_create_depth(objPlayer.x, objPlayer.y, depth, objEBullet);
        //shot.speed = random_range(20*objPlayer.shotSpeed-1, 20*objPlayer.shotSpeed+1);
        shot.direction = objPlayer.lookDir + random_range(objPlayer.spread, -objPlayer.spread);
        }
*/
/*for(var i = 0; i < 12; i += random_range(0,4);)
        {
        var spark = instance_create_depth(x, y, depth, objMuzzleSpark);
        spark.speed = random_range(5, 10);
        spark.direction = direction + random_range(sparkFan, -sparkFan);
		spark.sparkLifetime = 0.7;
        }
		
var smoke = instance_create_depth(x, y, depth, objGunSmoke);
smoke.direction = direction;
smoke.speed = random_range(0.2, 0.75);
smoke.smokeScale = random_range(0.75, 1.25);
smoke.smokeAlpha = random_range(0.5, 0.8);