image_angle += spin

if ammoThrow <= 0 {image_index = 1} else {image_index = 0}

switch (sprite_index) {
	//guns
    case sprShotgun: weapon = objWpnShotgun; break;
    case sprSpas12: weapon = objWpnSpas12; break;
    case sprBaikal: weapon = objWpnBaikal; break;
    case sprDoubleBarrel: weapon = objWpnDoubleBarrel; break;
    case sprSawedOff: weapon = objWpnSawedOff; break;
    case sprSkorpion: weapon = objWpnSkorpion; break;
    case sprAK47:
	case sprAK47_ru: weapon = objWpnAK47; break;
	case sprM16: weapon = objWpnM16; break;
	case sprSilencer: weapon = objWpnSilencer; break;
	case sprMagnum_ru:
	case sprMagnum: weapon = objWpnMagnum; break;
	case sprMP5: weapon = objWpnMP5; break;
	case sprPistol: weapon = objWpnPistol; break;
	//melee
	case sprBat:
	case sprBatRu: weapon = objWpnBat; break;
	case sprKnife: weapon = objWpnKnife; break;
	case sprButterfly: weapon = objWpnButterfly; break;
	case sprGolfClub: weapon = objWpnClub; break;
	case sprPipe: weapon = objWpnPipe; break;
    default: break;
}

if (speed < 0.01)
    {
    var pickup = instance_create_depth(x, y, depth, weapon);
    pickup.sprite_index = sprite_index;
    pickup.image_angle = image_angle;
    pickup.ammo = ammoThrow;
    instance_destroy();
    }