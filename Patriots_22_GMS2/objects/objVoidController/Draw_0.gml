direction += 0.25
draw_set_alpha(alpha);

//void type values (HM1 style)
switch (voidType) {
	case "pink/cyan": //default void colors
		color1 = merge_color(c_black,merge_color(merge_color(c_fuchsia,c_aqua,0.5+lengthdir_x(0.5,direction*3.12)),c_red,0.125+lengthdir_y(0.125,direction*1.73)),0.75+lengthdir_y(0.25,direction*1.73));
		color2 = c_black;
		break;
    case "dawn":
		color1 = merge_color(c_purple,merge_color(merge_color(c_orange,c_yellow,0.5+lengthdir_x(0.5,direction*3.12)),c_red,0.125+lengthdir_y(0.125,direction*1.73)),0.75+lengthdir_y(0.25,direction*1.73));
		color2 = c_purple;
        break;
	case "trauma":
		color1 = merge_color(c_white,c_yellow,0.5+lengthdir_x(0.5,direction*2.1245));
		color2 = merge_color(c_white,merge_color(merge_color(c_yellow,c_fuchsia,0.5+lengthdir_x(0.5,direction*3.12)),c_aqua,0.125+lengthdir_y(0.125,direction*1.73)),0.75+lengthdir_y(0.25,direction*1.73));
		break;
    default:
        break;
}

/*
if global.comboFlash = 1 {
color1=merge_color(c_red,c_black,amount)
color2=merge_color(c_maroon,c_black,amount)
} else {
color1=merge_color(c_yellow,c_black,amount)
color2=merge_color(c_orange,c_black,amount)}
*/
draw_rectangle_color(-room_width-60,-room_height-60,(room_width*2)+60,(room_height*2)+60,color1,color1,color2,color2,0)
draw_set_alpha(1);