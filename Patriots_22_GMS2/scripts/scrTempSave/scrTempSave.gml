function scrTempSave(){
global.checkpoint = buffer_create(1, buffer_grow, 1);

global.tempSave = function(buf = global.checkpoint)
{
	buffer_seek(buf, 0, 0);
	buffer_write(buf, buffer_u16, instance_number(objEntity));
	with objEntity
	{
		buffer_write(buf, buffer_u16, object_index);
		buffer_write(buf, buffer_f16, x);
		buffer_write(buf, buffer_f16, y);
		buffer_write(buf, buffer_f32, depth);
		SaveState(buf);
	}
}
}