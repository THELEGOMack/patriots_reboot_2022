event_inherited();
sparkFan = random_range(15, 30);

//smoke
var smoke = instance_create_depth(x, y, depth, objGunSmoke);
smoke.direction = image_angle; //busted?
smoke.speed = random_range(0.2, 0.4);
smoke.smokeScale = random_range(0.75, 1);
smoke.smokeAlpha = random_range(0.35, 0.6);

//sparks
for(var i = 0; i < 3; i += random_range(0,2);)
        {
        var spark = instance_create_depth(x, y, depth, objMuzzleSpark);
        spark.speed = random_range(5, 10);
        spark.direction = image_angle + random_range(sparkFan, -sparkFan);
        }