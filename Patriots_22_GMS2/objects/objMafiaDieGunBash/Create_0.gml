image_index = 0;
image_speed = 0;
image_angle = direction;
event_inherited();
var _animate = function() {image_speed = 1.5;}
var _sfx = function() {
	audio_play_sound(sndHit1, 10, false);
	scrBleed(24, 1.5, direction+180);
}
call_later(20, time_source_units_frames, _animate);
call_later(25, time_source_units_frames, _sfx);