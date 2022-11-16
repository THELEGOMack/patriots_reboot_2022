if weapon != noone
    {
    var pickup = instance_create_layer(x, y, "body_layer", objWeapon);
    pickup.sprite_index = drop;
    pickup.image_angle = random(360);
    pickup.ammo = currentAmmo;
    }
else exit