
if (room != r1) {
	planting = false;
	exit;
}

#region Planting

if (keyboard_check_pressed(ord("P"))){
	planting =!planting;
}

if (planting){
	mx = mouse_x;
	my = mouse_y;
	
	if (mouse_wheel_up())	selectCrop += 1;
	if (mouse_wheel_down())	selectCrop -= 1;
	
	if (selectCrop > sprite_get_number(spr_crops_picked_strip7) - 1){
		selectCrop = 0;
	}
	
	if (selectCrop < 0) selectCrop = sprite_get_number(spr_crops_picked_strip7) - 1;
	
	if (mouse_check_button_pressed(mb_left)){
		instance_create_crop(mx, my, selectCrop);
	}
}

#endregion

if (instance_exists(oCrop) and keyboard_check_pressed(ord("G"))){
	with (oCrop){
		if (growthStage < maxGrowthStage){
			daysOld += 1;
			
			var firstGrowth = 0;
			if (daysOld > 0) { firstGrowth = 1; }
			growthStage = firstGrowth + (daysOld div growthStageDuration);
		} else {
			growthStage = maxGrowthStage;
			fullyGrown = true;
			alarm[1] = 1;
		}
	}
}