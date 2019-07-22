if (room == r1){
	
	if (instance_exists(oCrop)){
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
	} else if (ds_crops_data[# 0, 0] != -1) {
		var h = ds_grid_height(ds_grid_height(ds_crops_data));
		var yy = 0;
		repeat (h) {
			ds_crops_data[# 3, yy] += 1;
			yy += 1;
		}
	}

}

