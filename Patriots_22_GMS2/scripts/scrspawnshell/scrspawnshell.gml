function scrSpawnShell(){
var _shellInst = instance_create_layer(x + lengthdir_x(shellSource, lookDir), y + lengthdir_y(shellSource, lookDir), layer, objShell);
switch(weapon)
    {
    case "Shotgun":  _shellInst.image_index = 0; _shellInst.direction += 180;																					  break;
    case "AK47":
    case "M16":      _shellInst.image_index = 1; _shellInst.direction += 180;																					  break;
    case "MP5":      _shellInst.image_index = 2; _shellInst.direction = random(360); _shellInst.speed = random_range(3, 6); _shellInst.image_angle = random(360); break;
    case "Silencer": _shellInst.image_index = 2;																												  break;
    default:																																					  break;
    }
}