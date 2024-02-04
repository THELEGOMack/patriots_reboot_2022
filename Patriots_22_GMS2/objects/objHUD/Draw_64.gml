//letterboxing
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_width(), letterboxHeight, false);
draw_rectangle(0, display_get_height()-letterboxHeight, display_get_width(), display_get_height(), false);
draw_set_color(c_white);

//version number
var text_ver = string(global.version);
draw_set_font(fntPlaceholder);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(x, display_get_height()-32, text_ver, 1, 1, 0);

//debug UI
if instance_exists(objPlayer){
	draw_set_font(fntPlaceholder);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var text_1 = "halo: " + string(objPlayer.halo);
    var text_2 = "legAngle: " + string(objPlayer.legAngle);
    var text_3 = "legIndex: " + string(objPlayer.legIndex);
	var text_4 = "lookDir: " + string(objPlayer.lookDir);
	var text_5 = "direction: " + string(objPlayer.direction);
	var text_6 = "attacking: " + string(objPlayer.attacking);
	var text_7 = "bulletCount: " + string(objPlayer.bulletCount);
	var text_8 = "weaponType: " + string(objPlayer.weaponType);
	var text_9 = "currentAmmo: " + string(objPlayer.currentAmmo);
	var text_10 = "shootTimer: " + string(objPlayer.shootTimer);
	var text_11 = "CAM X MOV: " + string(objCursorBox.xMovement);
	var text_12 = "CAM Y MOV: " + string(objCursorBox.yMovement);
    draw_text_transformed(x, y, text_1, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak, text_2, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*2, text_3, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*3, text_4, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*4, text_5, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*5, text_6, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*6, text_7, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*7, text_8, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*8, text_9, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*9, text_10, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*10, text_11, 1, 1, 0)
    draw_text_transformed(x, y+debugLineBreak*11, text_12, 1, 1, 0)
}