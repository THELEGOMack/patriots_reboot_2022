if speed > 0.5
    {
    draw_sprite_ext(sprMafiaLegs, legIndex, x+1, y+1, image_xscale, image_yscale, legAngle, c_black, 0.5);
    draw_sprite_ext(sprMafiaLegs, legIndex, x, y, image_xscale, image_yscale, legAngle, c_white, image_alpha);
    }
draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, c_white, image_alpha);

if global.debug = true{
var text_1 = "Alert: " + string(alertTimer);
var text_2 = "Aggro: " + string(aggroTimer);
var text_3 = "State: " + string(stateTXT);
var text_4 = "See Player " + string(seePlayer);
var text_5 = "Ammo: " + string(currentAmmo);
draw_text_transformed_color(x+10, y-5, text_1, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1);
draw_text_transformed_color(x+10, y-10, text_2, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1);
draw_text_transformed_color(x+10, y-15, text_3, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1);
draw_text_transformed_color(x+10, y-20, text_4, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1);
draw_text_transformed_color(x+10, y-25, text_5, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1);
    
var totalAngle = point_direction(x, y, objPlayer.x, objPlayer.y);
var text_angle_1 = angle_difference(totalAngle, direction);
draw_text_transformed_color(x, y+30, text_angle_1, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1);

draw_line_width_color(x, y, x+lengthdir_x(sightDistance, direction), y+lengthdir_y(sightDistance, direction), 1, c_red, c_red);
draw_line_width_color(x, y, objPlayer.x, objPlayer.y, 1, c_aqua, c_aqua);
}