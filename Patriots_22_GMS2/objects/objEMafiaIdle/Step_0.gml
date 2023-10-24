event_inherited();
scrEStateStatic();

if itemDrop != noone
{
	if (state != "idle") and (dropped = 0)
	{
		var _drop = instance_create_depth(x, y, depth+100, objItemDrop);
		_drop.image_index = itemDrop;
		dropped = 1;
	}
}

if alerted = true {sprite_index = spriteSwitch}