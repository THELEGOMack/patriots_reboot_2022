draw_line_color(x, y, x + lengthdir_x(50, aimDir), y + lengthdir_y(50, aimDir), c_red, c_red);
draw_line_color(x, y, x + lengthdir_x(50, lookDir), y + lengthdir_y(50, lookDir), c_lime, c_lime);

draw_set_font(fntPlaceholder);
//var text_1 = "ammo: " + string(ammo);
var text_2 = "weapon: " + string(weapon);
var text_3 = "currentAmmo: " + string(currentAmmo);
//draw_text_transformed_color(x+10, y-4, text_1, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
draw_text_transformed_color(x+10, y-8, text_2, 0.25, 0.25, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
draw_text_transformed_color(x+10, y-12, text_3, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)

event_inherited();