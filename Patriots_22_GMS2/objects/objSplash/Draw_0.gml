draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
draw_set_font(fntSplash);
//kerning
draw_text_transformed_color(_textX, _textY-30, "Based on sprites, universe", 1, 1, 0, c_white, c_white, c_white, c_white, opacity);
draw_text_transformed_color(_textX, _textY, "and characters created by", 1, 1, 0, c_white, c_white, c_white, c_white, opacity);
draw_text_transformed_color(_textX, _textY+30, "DENNATON GAMES", 1, 1, 0, c_aqua, c_fuchsia, c_red, c_fuchsia, opacity);
draw_text_transformed_color(_textX+128, _textY+30, ".", 1, 1, 0, c_white, c_white, c_white, c_white, opacity);