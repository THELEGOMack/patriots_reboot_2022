draw_self();
//Patriots code FOR REFERNCE ONLY
/*
// Black out the background for readability.
draw_set_colour(c_black);
draw_set_alpha(1 * alphaFactor);

draw_rectangle(view_xview, view_yview + 85, view_xview + view_wview, view_yview + 170, false);

draw_set_colour(c_white);

draw_rectangle(view_xview, view_yview + 86, view_xview + view_wview, view_yview + 102, false);
draw_rectangle(view_xview, view_yview + 108, view_xview + view_wview, view_yview + 124, false);
draw_rectangle(view_xview, view_yview + 130, view_xview + view_wview, view_yview + 146, false);
draw_rectangle(view_xview, view_yview + 152, view_xview + view_wview, view_yview + 168, false);

draw_rectangle_colour(view_xview, view_yview + 87, view_xview + view_wview, view_yview + 101, dkBlue, dkBlue, dkBlue, dkBlue, false);
draw_rectangle_colour(view_xview, view_yview + 109, view_xview + view_wview, view_yview + 123, dkRed, dkRed, dkRed, dkRed, false);
draw_rectangle_colour(view_xview, view_yview + 131, view_xview + view_wview, view_yview + 145, dkGray, dkGray, dkGray, dkGray, false);
draw_rectangle_colour(view_xview, view_yview + 153, view_xview + view_wview, view_yview + 167, dkRed, dkRed, dkRed, dkRed, false);

draw_set_colour(c_black);
draw_set_alpha(0.75 * alphaFactor);
draw_rectangle(view_xview, view_yview, view_xview + view_wview, view_yview + view_hview, 0);
draw_set_alpha(1 * alphaFactor);

// Draw mask and outline.
for (i = 0; i < availableCount; i += 1) {
    findMask = ds_list_find_value(masksAvailable, i);

    if currentMask = findMask {
        scale = 1.4;
        color = c_white
    } else {
        scale = 1;
        color = fadedColour
    };

    if currentMask = findMask d3d_set_fog(true, c_fuchsia, 0, 0)
    else d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(findMask, 0, (view_xview + view_wview[0] / 2 + 1) + addx + i * 120, view_yview + view_hview[0] / 2, scale, scale, lengthdir_x(5, wiggle + i * 45), c_white, .5);
    draw_sprite_ext(findMask, 0, (view_xview + view_wview[0] / 2 - 1) + addx + i * 120, view_yview + view_hview[0] / 2, scale, scale, lengthdir_x(5, wiggle + i * 45), c_white, .5);
    draw_sprite_ext(findMask, 0, (view_xview + view_wview[0] / 2) + addx + i * 120, view_yview + view_hview[0] / 2 + 1, scale, scale, lengthdir_x(5, wiggle + i * 45), c_white, .5);
    draw_sprite_ext(findMask, 0, (view_xview + view_wview[0] / 2) + addx + i * 120, view_yview + view_hview[0] / 2 - 1, scale, scale, lengthdir_x(5, wiggle + i * 45), c_white, .5);
    d3d_set_fog(false, c_black, 0, 0);

    draw_sprite_ext(findMask, 0, (view_xview + view_wview[0] / 2) + addx + i * 120, view_yview + view_hview[0] / 2, scale, scale, lengthdir_x(5, wiggle + i * 45), color, 1);

};

current = ds_list_find_index(masksAvailable, currentMask);
if on = 1 targetx = -current * 120
else targetx = 480;
addx += ((targetx) - addx) * 0.1;

// Draw gradients.
draw_sprite_ext(sprPlayerClip, 0, view_xview, view_yview, 1, 6, 0, c_white, 1 * alphaFactor);
draw_sprite_ext(sprPlayerClip, 0, view_xview + view_wview, view_yview, -1, 6, 0, c_white, 1 * alphaFactor);

// Dance around a lil! Fuck!
wiggle += 2;