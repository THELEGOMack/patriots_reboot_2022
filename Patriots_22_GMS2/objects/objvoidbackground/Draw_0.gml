///@description Copied from HM1
direction += 0.25
color2 = c_black
color1 = merge_color(c_black,merge_color(merge_color(c_fuchsia,c_aqua,0.5+lengthdir_x(0.5,direction*3.12)),c_red,0.125+lengthdir_y(0.125,direction*1.73)),0.75+lengthdir_y(0.25,direction*1.73))
draw_rectangle_color(view_xport[0]-60,view_yport[0]-60,view_xport[0]+view_wport[0]+60,view_yport[0]+view_hport[0]+60,color1,color1,color2,color2,0)