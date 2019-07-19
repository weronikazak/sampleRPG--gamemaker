///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type

//Create the instane
var inst = instance_create_layer(argument0, argument1, "Instances", oCrop);

with (inst){
	cropType = argument2;
	growthStageDuration = Crops.ds_crops_types[#0, cropType];
}

return inst;