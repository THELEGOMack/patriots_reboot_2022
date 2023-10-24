function scrVoidDisable(){
	layer_set_visible(layer_get_id("edges_ext"), true);
	layer_set_visible(layer_get_id("outdoor_ext"), true);
	layer_set_visible(layer_get_id("outdoor2_ext"), true);
	layer_set_visible(layer_get_id("WallCorners_ext"), true); //consolidate these lines
	instance_activate_layer("Walls_ext");
	instance_activate_layer("furniturefloor2_ext");
	instance_activate_layer("furniturefloor_ext");
	instance_activate_layer("furniture_ext");
	instance_activate_layer("furniturehigh_ext"); //these too
	if instance_exists(objShadowSurface)
	{
		//update shadow surface
		//vvvvv this is just a temporary fix! vvvvv
		instance_destroy(objShadowSurface);
		instance_create_layer(x, y, "wallshadow", objShadowSurface);
	}
	global.voidActive = false;
	exit;
}