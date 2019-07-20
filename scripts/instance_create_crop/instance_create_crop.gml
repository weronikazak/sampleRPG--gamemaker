///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type

var cs = Crops.cellSize;
var gx = argument0 div cs;
var gy = argument1 div cs;
var i_grid = Crops.ds_crops_instances;
var cell = i_grid[# gx, gy];

if (cell == 0){
	var xx = gx*cs;
	var yy = gy*cs;

	//check for soil
	var lay_id = layer_get_id("soil");
	var map_id = layer_tilemap_get_id(lay_id);
	var data = tilemap_get_at_pixel(map_id, argument0, argument1);

	if (data == 0) {
		show_debug_message("There is no soil here");
		return false;
	} else {
		show_debug_message("There is soil here");
	}

	//Create the instane
	var inst = instance_create_layer(xx+(cs/2), yy+(cs/2), "Instances", oCrop);
	i_grid[# gx, gy] = inst;

	with (inst){
		cropType = argument2;
		growthStageDuration = Crops.ds_crops_types[# 0, cropType];
	}

	return inst;
} else {
	show_debug_message("There is already something there");
	return false;
}
