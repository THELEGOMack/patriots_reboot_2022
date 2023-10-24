draw_set_font(fntInstruction);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text_ext_color(x, y, string("{0}:{1} {2}", hour, minute, ampm), 0, 3840, c_red, c_red, c_red, c_red, 1);

draw_set_font(fntDialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_color(x, y, string("{0} {1}, {2}", day, month, year), 0, 3840, c_red, c_red, c_red, c_red, 1);

draw_set_font(fntDialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text_ext_color(x, y, string("{0} {1}", city, state), 0, 3840, c_red, c_red, c_red, c_red, 1);