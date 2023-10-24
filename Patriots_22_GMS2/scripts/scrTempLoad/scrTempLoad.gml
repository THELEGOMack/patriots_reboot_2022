function scrTempLoad(){
global.checkpoint = buffer_create(1, buffer_grow, 1);
	
global.tempLoad = function tempLoad(buf = global.checkpoint)
{
	buffer_seek(buf, 0, 0);
	with objEntity {instance_destroy();}
	var count = buffer_read(buf, buffer_u16);
	repeat(count)
	{
		var _object = buffer_read(buf, buffer_u16);
		var _x = buffer_read(buf, buffer_f16);
		var _y = buffer_read(buf, buffer_f16);
		var _depth = buffer_read(buf, buffer_f32);
		var inst = instance_create_depth(_x, _y, _depth, _object);
		inst.x = _x;
		inst.y = _y;
		inst.LoadState(buf);
	}
}
}