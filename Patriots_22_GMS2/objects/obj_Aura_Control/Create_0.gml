/// @description READ ME FIRST

// IMPORTANT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// Thank you for buying AURA for GMS2. This iteration of the lighting engine comes
// with multiple optimisations, a new soft shadows option, the ability to create
// shadow casters from a tile map, and a number of extra scripts to make using the
// engine a lot easier.

// All scripts are fully commented and the engine should "just work" in most cases,
// but PLEASE read the comments in each object, and the comments in all the scripts,
// to get to know how the engine works so you can get the most from it.

// A brief overview of how to set it up in your own project is as follows:
//
//	1)	Add this control object to a layer in a room
//
//	2)	Add light objects (you can use those supplied or create your own, but if you 
//		create your own, it MUST have the parent "obj_Aura_Light_Parent"). IMPORTANT!
//		Light objects should have their "Visible" flag set to false in the object 
//		properties.
//
//	3)	And wall/solid objects to cast shadows (again, you can use those supplied or 
//		you can create your own, in which case they MUST have been assigned the parent
//		"obj_Aura_ShadowCaster_Parent").
//
//	4)	Optionally, add a tilemap into a room to be used as a shadow caster. The DEMO room
//		has an example of this.
// 
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// This is the main light controller object. It will do all the light drawing and 
// should be set to a layer LOWER than everything that you want the light to appear 
// over. Note that this engine draws the lighting surface using an "overlay" blend,
// rather than an additive blend which gives much more natural look and also means 
// that things drawn under a light will not be too brilliant or saturated.

// Note too that you will get different effects if you place the AURA controller on a 
// layer above or below the shadow caster objects, and it is recommended that you do 
// not place them both on the same layer.

// IMPORTANT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// All lights in the demo are created on a layer called "Lights" that is present
// in each demo room. This is NOT a requisite of the engine, and simply a convenience
// for the demo. You can make and name layers as you wish and AURA should work fine.
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// Now initialise the lighting

// You give an alpha value for the ambience colour. This value is from 1 to 0, with 
// a larger value indicating brighter ambient light. The colour is the "tint" that 
// you ewant the ambient light to have. You can also enable anti-aliasing and tell 
// Aura which view to use (set to -1 if you want no views).

aura_init(ambientAlpha, ambientColor, aaEnable, -1, -1, soft, aura_blend_multiply);

// This function creates two further variables which you can use:
//
// aura_alpha - sets the brightness for the ambience
// aura_colour - sets the colour for the ambient light
//
// These variables can be used at any time to change the ambience AT NO COST TO PERFORMANCE
// and so you can use them to create day/night cycles, flashing alarms, etc...
// AURA also includes a number of "getter" and "setter" scripts that you can use to change
// both the engine properties and an individual lights properties at any time.





