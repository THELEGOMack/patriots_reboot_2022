//initialize variables
depth = -9000
/*
//patriots code FOR REFERENCE ONLY
// detect some shit, whatever!
//masksAvailable = ds_list_create();
//if instance_exists(objPlayerBrody) {instance_destroy(); exit;}
//if global.drawMask {instance_destroy(); exit;};
//ds_list_copy(masksAvailable, objPlayer.masksAvailable);

//availableCount = ds_list_size(masksAvailable);

// define variables
//currentMask = ds_list_find_value(masksAvailable, 0);
maskName = "undefined mask name";
maskDescription = "undefined mask description";


// drawing variables
wiggle = 0;
scale = 1;
color = c_white;
on = 1;
addx = -700;
current = 0;
i = 0;

screenHeight = display_get_gui_height();
screenWidth = display_get_gui_width();

stripeMode = -1;

fadedColour = merge_colour(c_black,c_white,0.75);

fontTopColour = make_colour_rgb(26, 106, 148);
fontBottomColour = make_colour_rgb(0, 174, 239);

dkBlue = make_colour_rgb(11, 32, 43);
dkGray = make_colour_rgb(78,78,78);
dkRed = make_colour_rgb(50, 14, 14);

alphaFactor = 1;