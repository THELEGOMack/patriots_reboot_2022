opacity = 0;
var _fadeIn = function()
{
	opacity += 0.05;
}
var _fadeOut = function()
{
	opacity -= 0.05;
}

fadeTimer = time_source_create(time_source_game, 2, time_source_units_frames, _fadeIn, [], 20, time_source_expire_after);
fadeTimer2 = time_source_create(time_source_game, 2, time_source_units_frames, _fadeOut, [], 20, time_source_expire_after);
alarm[0] = 110;

_textX = room_width/2;
_textY = room_height/2;