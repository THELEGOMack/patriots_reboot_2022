if baseVoid = false
{
	alpha = Wave((0.15 * alphaMod), (0.25 * alphaMod), 120, 0);
	draw_set_alpha(alpha)
}
direction += 0.25
//default void colors
color2 = c_black
color1 = merge_color(c_black,merge_color(merge_color(c_fuchsia,c_aqua,0.5+lengthdir_x(0.5,direction*3.12)),c_red,0.125+lengthdir_y(0.125,direction*1.73)),0.75+lengthdir_y(0.25,direction*1.73))
//dawn void colors
color3 = merge_color(c_purple,merge_color(merge_color(c_orange,c_yellow,0.5+lengthdir_x(0.5,direction*3.12)),c_red,0.125+lengthdir_y(0.125,direction*1.73)),0.75+lengthdir_y(0.25,direction*1.73))
color4 = c_purple

switch (voidType) {
	case 0: //default void colors
		draw_rectangle_color(-60,-60,room_width+60,room_height+60,color1,color1,color2,color2,0)
		break;
    case 1: //dawn
		draw_rectangle_color(-60,-60,room_width+60,room_height+60,color3,color3,color4,color4,0)
        break;
    default: //default void
        //draw_rectangle_color(-60,-60,room_width+60,room_height+60,color1,color1,color2,color2,0)
        break;
}

//draw_rectangle_color(-60,-60,room_width+60,room_height+60,color1,color1,color2,color2,0)
draw_set_alpha(1)