for (var i = 0; i < random_range(6, 14); ++i) {
    var _speck = instance_create_layer(x, y, "blood_layer", objBloodSpeck);
	_speck.direction = random(359);
	_speck.speed = random_range(1, 4);
}
event_inherited();