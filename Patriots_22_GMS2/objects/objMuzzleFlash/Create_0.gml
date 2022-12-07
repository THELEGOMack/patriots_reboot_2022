var bullet = instance_create_layer(objPlayer.x, objPlayer.y, layer, objBullet);
bullet.damage = objPlayer.damage;
bullet.speed = 20*objPlayer.shotSpeed;
bullet.direction = objPlayer.lookDir + random_range(objPlayer.spread, -objPlayer.spread);