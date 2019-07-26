if (keyboard_check_pressed(ord("I"))){
	showInventory = !showInventory;
}

if (!showInventory)	{ exit; }

#region Mouse Slot
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_x_buff = (cellSize+xBuffer)*scale;
var cell_y_buff = (cellSize+yBuffer)*scale;

var i_mouseX = mousex - slotsX;
var i_mouseY = mousey - slotsY;

var nx = i_mouseX div cell_x_buff;
var ny = i_mouseY div cell_y_buff;

if (nx >= 0 and nx < invSlotsWidth and ny >= 0 and ny < invSlotsHeight){
	var sx = i_mouseX - (nx*cell_x_buff); 
	var sy = i_mouseY - (ny*cell_y_buff);
	
	if ((sx < cellSize*scale) and (sy < cellSize*scale)){
		mSlotX = nx;
		mSlotY = ny;
	}

}

// set selected slot to mouse position
//number from 0 to 16

selectedSlot = min(invSlots-1, mSlotX + (mSlotY*invSlotsWidth));

#endregion

// Pickup item

var inv_grid = ds_inventory;
var ssItem = inv_grid[# 0, selectedSlot];

if (pickupSlot != -1){ //if we pick something up
	if (mouse_check_button_pressed(mb_left)){
		if (ssItem == item.none){
			inv_grid[# 0, selectedSlot] = inv_grid[# 0, pickupSlot];
			inv_grid[# 1, selectedSlot] = inv_grid[# 1, pickupSlot];
			
			inv_grid[# 0, pickupSlot] = item.none;
			inv_grid[# 1, pickupSlot] = 0;
			
			pickupSlot = -1;

		} else if (ssItem == inv_grid[# 0, pickupSlot]){
			if (selectedSlot != pickupSlot){
				inv_grid[# 1, selectedSlot] += inv_grid[# 1, pickupSlot];
			
				inv_grid[# 0, pickupSlot] = item.none;
				inv_grid[# 1, pickupSlot] = 0;
			}
			
			pickupSlot = -1;
			
		} else {
			var ssItemNumber = inv_grid[# 1, selectedSlot];
			inv_grid[# 0, selectedSlot] = inv_grid[# 0, pickupSlot];
			inv_grid[# 1, selectedSlot] = inv_grid[# 1, pickupSlot];
			
			inv_grid[# 0, pickupSlot] = ssItem;
			inv_grid[# 1, pickupSlot] = ssItemNumber;
			
			//pickupSlot = -1;	
		}
	}
}

else if (ssItem != item.none){
	
	if (mouse_check_button_pressed(mb_middle)){
		inv_grid[# 1, selectedSlot] -= 1;
		
		//destroy item in inventiry if it was the last one
		if (inv_grid[# 1, selectedSlot] == 0){
			inv_grid[# 0, selectedSlot] = item.none;
			
		}
		
		//create the item
		var inst = instance_create_layer(oPlayer.x , oPlayer.y, "Instances", oItems);
		with (inst){
			itemNum = ssItem;
			xFrame = itemNum mod (sprWidth/cellSize);
			yFrame = itemNum div (sprWidth/cellSize);
		}
		show_debug_message("Dropped an item");
	}
	
	//drop pickup item into slot
	if (mouse_check_button_pressed(mb_right)){
		pickupSlot = selectedSlot;
	}
}
