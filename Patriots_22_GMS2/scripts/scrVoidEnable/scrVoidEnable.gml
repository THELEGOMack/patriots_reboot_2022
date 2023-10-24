function scrVoidEnable(){
	layer_set_visible(layer_get_id("edges_ext"), false);
	layer_set_visible(layer_get_id("outdoor_ext"), false);
	layer_set_visible(layer_get_id("outdoor2_ext"), false);
	layer_set_visible(layer_get_id("WallCorners_ext"), false); //consolidate these lines
	instance_deactivate_layer("Walls_ext");
	instance_deactivate_layer("furniturefloor2_ext");
	instance_deactivate_layer("furniturefloor_ext");
	instance_deactivate_layer("furniture_ext");
	instance_deactivate_layer("furniturehigh_ext"); //these too
	
	if instance_exists(objShadowSurface)
	{
		//update shadow surface
		//vvvvv this is just a temporary fix! vvvvv
		instance_destroy(objShadowSurface);
		instance_create_layer(x, y, "wallshadow", objShadowSurface);
	}
	
	if instance_exists(objSetupPathway)
	{
		//update enemy pathing
		instance_destroy(objSetupPathway);
		instance_create_depth(x, y, -99, objSetupPathway);
	}
	
	global.voidActive = true;
	exit;
}

//find a way to "fade" into this?