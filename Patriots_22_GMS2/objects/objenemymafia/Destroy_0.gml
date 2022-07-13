if weapon != noone
    {
    var pickup = instance_create_layer(x, y, objWeapon.layer, objWeapon);
    pickup.sprite_index = drop;
    pickup.image_angle = random(360);
    pickup.ammo = currentAmmo;
    }
else exit