if (room == r1){
	ds_crops_instances = ds_grid_create(room_width div cellSize, room_height div cellSize);
	ds_grid_clear(ds_crops_instances, 0);
	
	//respawn the crops
	if (ds_crops_data[# 0, 0] != -1){
		var inst_num = ds_grid_height(ds_crops_data);
		var slot = 0;
		repeat (inst_num) {
			respawn_crop(
				ds_crops_data[# 0, slot],
				ds_crops_data[# 1, slot],
				ds_crops_data[# 2, slot],
				ds_crops_data[# 3, slot]
			);
			
			slot += 1;
		}
		with (oCrop){
			var firstGrowth = 0;
			if (daysOld > 0) {
				firstGrowth = 1;
			}
			growthStage = firstGrowth + (daysOld div growthStageDuration);
			
			if (growthStage >= maxGrowthStage) {
				growthStage = maxGrowthStage;
				fullyGrown = true;
				alarm[1] = 1;
			}
		}
	}
}