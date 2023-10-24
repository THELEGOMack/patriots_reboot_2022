for (var i = 0; i < random_range(4, 10); ++i) {
    var _speck = instance_create_layer(x, y, "blood_layer", objBloodSpeck);
	_speck.direction = direction + random_range(-25, 25);
	_speck.speed = random_range(1, 5);
}
event_inherited();