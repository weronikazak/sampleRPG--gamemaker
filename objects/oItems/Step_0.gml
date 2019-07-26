if (drop_move){
	x = lerp(x, goalX, 0.1);
	y = lerp(y, goalY, 0.1);

	if (abs(x - goalX) < 1 and (y - goalY) < 1){
		drop_move = false;
	}
} else {
	if (keyboard_check(ord("O"))) exit;
	var px = oPlayer.x;
	var py = oPlayer.y;
	var r = 32;
	 if (point_in_rectangle(px, py, x-r, y-r, x+r, y+r)){
		//Are we on top of the player?
		r = 2;
		if (!point_in_rectangle(px, py, x-r, y-r, x+r, y+r)){
			//move towards the player for pickup
			x = lerp(x, px, 0.1);
			y = lerp(y, py, 0.1);

		} else {
			var in = itemNum;
			
			with (Inventory){
				var ds_inv = ds_inventory;
				var pickedUp = false;
				
				//check if item exits in envintory
				var yy = 0;
				repeat (invSlots){
					if (ds_inv[# 0, yy] == in){
						ds_inv[# 1, yy] += 1;
						pickedUp = true;
					break;
					} else {
						yy += 1;
					}
				}
				
				//otherwise add item to an empty slot
				
				if (!pickedUp){
					var yy = 0;
					repeat (invSlots){
						if (ds_inv[# 0, yy] == item.none){
							ds_inv[# 0, yy] = in;
							ds_inv[# 1, yy] += 1;
							pickedUp = true;
						break;
						} else {
							yy += 1;
						}
					}
				}

			}				
			//Destroy item if picked_up
			if (pickedUp){
				instance_destroy();
				show_debug_message("Picked up an item");
			}
		}
	}
}