//letterboxing
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_width(), letterboxHeight, false);
draw_rectangle(0, display_get_height()-letterboxHeight, display_get_width(), display_get_height(), false);
draw_set_color(c_white);

//version number
var text_ver = string(global.version);
draw_text_transformed(x, display_get_height()-32, text_ver, 1, 1, 0);

//debug UI
if instance_exists(objPlayer){
	var text_1 = "P weapon: " + string(objPlayer.weapon);
    var text_2 = "P ammo: " + string(objPlayer.ammoPlayer);
    var text_3 = "P death count: " + string(objPlayer.deathCount);
	var text_4 = "P hp: " + string(objPlayer.hp);
	var text_5 = "P mask: " + string(objPlayer.mask);
	var text_6 = "P in bounds: " + string(global.playerInBounds);
	var text_7 = "P attacking: " + string(objPlayer.attacking);
    draw_text_transformed(x, y, text_1, 1, 1, 0)
    draw_text_transformed(x, y-debugLineBreak, text_2, 1, 1, 0)
    draw_text_transformed(x, y-debugLineBreak*2, text_3, 1, 1, 0)
    draw_text_transformed(x, y-debugLineBreak*3, text_4, 1, 1, 0)
    draw_text_transformed(x, y-debugLineBreak*4, text_5, 1, 1, 0)
    draw_text_transformed(x, y-debugLineBreak*5, text_6, 1, 1, 0)
    draw_text_transformed(x, y-debugLineBreak*6, text_7, 1, 1, 0)
}