//Patriots code FOR REFERENCE ONLY
/*
// Draw description.
draw_set_valign(fa_middle); draw_set_halign(fa_center); draw_set_font(fntDialogue);

draw_set_colour(merge_color(c_black,dkBlue,0.5+lengthdir_x(0.5,wiggle))); draw_text(screenWidth/2+3, screenHeight*0.85+3, string_upper(maskDescription));
draw_set_colour(c_white); draw_text(screenWidth/2, screenHeight*0.85, string_upper(maskDescription));

// Draw mask name.

draw_set_font(fntJustice); draw_set_colour(c_black);
draw_text(screenWidth/2+2, screenHeight*0.75+6, maskName);
draw_set_colour(merge_color(c_fuchsia,c_maroon,0.5+lengthdir_x(0.35,wiggle))); draw_text(screenWidth/2, screenHeight*0.75+4, maskName);

draw_text_colour(screenWidth/2 + 3 + lengthdir_x(5,wiggle), screenHeight*0.75 + 3 + lengthdir_x(5,wiggle), maskName, merge_colour(fontTopColour,c_black,0.5), merge_colour(fontTopColour,c_black,0.5), merge_colour(fontBottomColour,c_black,0.5), merge_colour(fontBottomColour,c_black,0.5), 1);
draw_text_colour(screenWidth/2 + lengthdir_x(5,wiggle), screenHeight*0.75 + lengthdir_x(5,wiggle), maskName, fontTopColour, fontTopColour, fontBottomColour, fontBottomColour, 1);

// Draw arrows.
draw_set_colour(c_black); draw_set_alpha(0.5);
draw_text(((screenWidth/2)-(string_width(maskName)*.7+lengthdir_x(6,wiggle)))+3, screenHeight*0.75+3, "<");
draw_text(((screenWidth/2)+(string_width(maskName)*.7+lengthdir_x(6,wiggle)))+3, screenHeight*0.75+3, ">");
draw_set_alpha(1);

draw_set_color(merge_color(dkBlue,c_white,0.5+lengthdir_x(0.35,wiggle)))
draw_text(((screenWidth/2)-(string_width(maskName)*.7+lengthdir_x(6,wiggle))), screenHeight*0.75, "<");
draw_text(((screenWidth/2)+(string_width(maskName)*.7+lengthdir_x(6,wiggle))), screenHeight*0.75, ">");