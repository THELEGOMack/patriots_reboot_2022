if (objPlayer.weapon = "Shotgun") {sprite_index = sprCursorShotgun}
else {sprite_index = sprCursor}

x = mouse_x
y = mouse_y

clamp(distance_to_object(objPlayer), 1, global.viewDistance)