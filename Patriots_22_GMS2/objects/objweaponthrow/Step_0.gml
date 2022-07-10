image_angle += spin

if (speed < 0.01)
    {
    var pickup = instance_create_layer(x, y, layer, objWeapon);
    pickup.sprite_index = sprite_index;
    pickup.image_angle = image_angle;
    pickup.ammo = ammoThrow;
    instance_destroy();
    }