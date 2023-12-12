/// @description trigger "open" flag
if startOpen = 0 {audio_play_sound(sndElevatorChime, 100, false, 1/instance_number(objElevator));}
doneOpen = 1;
doneClose = 0;
mask_index = sprElevatorMask;