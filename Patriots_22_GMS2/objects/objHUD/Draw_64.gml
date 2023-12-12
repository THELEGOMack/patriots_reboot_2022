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
	var text_1 = "canMove: " + string(global.canMove) + " | " + string(objPlayer.canMove);
    var text_2 = "canLook: " + string(global.canLook) + " | " + string(objPlayer.canLook);
    var text_3 = "canShoot: " + string(global.canShoot) + " | " + string(objPlayer.canShoot);
	//var text_4 = "P hp: " + string(objPlayer.hp);
	//var text_5 = "P mask: " + string(objPlayer.mask);
	//var text_6 = "P in bounds: " + string(global.playerInBounds);
	//var text_7 = "P attacking: " + string(objPlayer.attacking);
    draw_text_transformed(x, y, text_1, 1, 1, 0)
    draw_text_transformed(x, y-debugLineBreak, text_2, 1, 1, 0)
    draw_text_transformed(x, y-debugLineBreak*2, text_3, 1, 1, 0)
    //draw_text_transformed(x, y-debugLineBreak*3, text_4, 1, 1, 0)
    //draw_text_transformed(x, y-debugLineBreak*4, text_5, 1, 1, 0)
    //draw_text_transformed(x, y-debugLineBreak*5, text_6, 1, 1, 0)
   // draw_text_transformed(x, y-debugLineBreak*6, text_7, 1, 1, 0)
}