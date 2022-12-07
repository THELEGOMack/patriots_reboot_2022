//Global variable setup
scrGlobalVariables();

//Initialization
randomize()
window_set_cursor(cr_none)
#macro delta (delta_time/1000000)*global.timescale
audio_group_load(audiogroup_music)
audio_group_load(audiogroup_casings)

//room load (splash screen)
//if global.debug = true
//{
	room_goto(rmTitle)
//} else {
	//room_goto(rmSplash)
//}