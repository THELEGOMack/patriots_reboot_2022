sprite_index = objPlayer.mask;
image_index = choose(1, 2);
spin = (-1+round(random(1))*2)*random(3);
image_speed = 0;
friction = 0.2;
speed = random_range(4, 6);
direction = objPlayer.direction;