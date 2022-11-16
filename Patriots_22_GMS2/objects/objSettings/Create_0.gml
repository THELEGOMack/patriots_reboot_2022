//Global variable setup
scrGlobalVariables();

//Initialization
randomize()
window_set_cursor(cr_none)
#macro delta (delta_time/1000000)*global.timescale

//room load
if global.debug = true
{
	room_goto(rmTitle)
} else {
	room_goto(rmSplash)
}