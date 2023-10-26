function scrPlayMusic(_music, _offset){
	audio_stop_all();
	audio_play_sound(_music, 1000, true, global.musicVolume, _offset, 1);
}