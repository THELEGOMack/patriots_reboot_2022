/// @description DEMO Controller Create

// This object os only for the demo and can be removed without any issues from the prject.

// Setup demo vars
click_time = 0;

// Setup demo font (the font can be removed from the project without issues)
draw_set_font(fnt_DEMO);

// The "Demo" room uses tiles for the shadow caster so iitialise them (the tile layer
// is set when you call the aura_init function. The init function MUST BE CALLED BEFORE THIS
// otherwise you could get errors.
if room = rm_Aura_Demo
{
aura_shadowcaster_tile_init(32, 32, true);
}

