event_inherited();
/*
//debug
draw_path(path, x, y, 1);
var shootRangeDiff = shootRange;
var angleDiff = visConeW; //half of total cone width value
var getLineAboveX = x + lengthdir_x(sightMax, lookDir-angleDiff)
var getLineAboveY = y + lengthdir_y(sightMax, lookDir-angleDiff)
var getLineBelowX = x + lengthdir_x(sightMax, lookDir+angleDiff)
var getLineBelowY = y + lengthdir_y(sightMax, lookDir+angleDiff)
var getSRLineAboveX = x + lengthdir_x(sightMax, lookDir-shootRangeDiff)
var getSRLineAboveY = y + lengthdir_y(sightMax, lookDir-shootRangeDiff)
var getSRLineBelowX = x + lengthdir_x(sightMax, lookDir+shootRangeDiff)
var getSRLineBelowY = y + lengthdir_y(sightMax, lookDir+shootRangeDiff)
var _lookDirX = x + lengthdir_x(sightMax, lookDir);
var _lookDirY = y + lengthdir_y(sightMax, lookDir);
var _aimDirX = x + lengthdir_x(sightMax, aimDir);
var _aimDirY = y + lengthdir_y(sightMax, aimDir);
var _directionX = x + lengthdir_x(sightMax, direction);
var _directionY = y + lengthdir_y(sightMax, direction);

//viewcone
draw_line_width_color(x, y, getLineAboveX, getLineAboveY, 1, lineColor, lineColor);
draw_line_width_color(x, y, getLineBelowX, getLineBelowY, 1, lineColor, lineColor);
draw_line_width_color(x, y, getSRLineAboveX, getSRLineAboveY, 0.5, c_red, c_red);
draw_line_width_color(x, y, getSRLineBelowX, getSRLineBelowY, 0.5, c_red, c_red);

draw_line_width_color(x, y, _lookDirX, _lookDirY, 3, c_yellow, c_yellow);
draw_line_width_color(x, y, _aimDirX, _aimDirY, 2, c_aqua, c_aqua);
draw_line_width_color(x, y, _directionX, _directionY, 1, c_lime, c_lime);

draw_set_alpha(0.1);
draw_line_width_color(x, y, objPlayer.x, objPlayer.y, 8, pathCheckColor, pathCheckColor);
draw_set_alpha(0.75);
draw_line_width_color(x, y, objPlayer.x, objPlayer.y, 0.5, LOSCheckColor, LOSCheckColor);
draw_set_alpha(1);

var c_pink = merge_color(c_white, c_fuchsia, 0.75)
draw_set_alpha(0.02);
draw_circle_color(x, y, sightMax, c_white, c_white, false);
draw_circle_color(x, y, hearingRange, c_white, c_white, false);
draw_circle_color(x, y, sightMin, c_white, c_white, false);
draw_circle_color(x, y, killZone, c_pink, c_pink, false);
draw_set_alpha(1);

draw_set_font(fntPlaceholder);
var text_1 = "playerSpotted: " + string(playerSpotted);
var text_2 = "alerted: " + string(alerted);
var text_3 = "gunshotHeard: " + string(gunshotHeard);
var text_4 = "state: " + string(state);
var text_5 = "img_spd: " + string(image_speed);
var text_6 = "aggroTimer/aggroLimit: " + string(aggroTimer) + "/" + string(aggroLimit);
var text_7 = "shootTimer: " + string(shootTimer);
var text_8 = "weaponType: " + string(weaponType);
var text_9 = "speed: " + string(speed);
draw_text_transformed_color(x+10, y-4, text_1, 0.25, 0.25, 0, lineColor, lineColor, lineColor, lineColor, 1)
draw_text_transformed_color(x+10, y-8, text_2, 0.25, 0.25, 0, lineColor, lineColor, lineColor, lineColor, 1)
draw_text_transformed_color(x+10, y-12, text_3, 0.25, 0.25, 0, lineColor, lineColor, lineColor, lineColor, 1)
draw_text_transformed_color(x+10, y-16, text_4, 0.25, 0.25, 0, lineColor, lineColor, lineColor, lineColor, 1)
draw_text_transformed_color(x+10, y-20, text_5, 0.25, 0.25, 0, lineColor, lineColor, lineColor, lineColor, 1)
draw_text_transformed_color(x+10, y-24, text_6, 0.25, 0.25, 0, lineColor, lineColor, lineColor, lineColor, 1)
draw_text_transformed_color(x+10, y-28, text_7, 0.25, 0.25, 0, lineColor, lineColor, lineColor, lineColor, 1)
draw_text_transformed_color(x+10, y-32, text_8, 0.25, 0.25, 0, lineColor, lineColor, lineColor, lineColor, 1)
draw_text_transformed_color(x+10, y-36, text_9, 0.25, 0.25, 0, lineColor, lineColor, lineColor, lineColor, 1)