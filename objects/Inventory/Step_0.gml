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

var mouseInInventory = true;
if (nx >= 0 and nx < invSlotsWidth and ny >= 0 and ny < invSlotsHeight){
	var sx = i_mouseX - (nx*cell_x_buff); 
	var sy = i_mouseY - (ny*cell_y_buff);
	
	if ((sx < cellSize*scale) and (sy < cellSize*scale)){
		mSlotX = nx;
		mSlotY = ny;
	}

} else {
	var mouseInInventory = false;
}

// set selected slot to mouse position
//number from 0 to 16

selectedSlot = min(invSlots-1, mSlotX + (mSlotY*invSlotsWidth));

#endregion

// Pickup item

var inv_grid = ds_inventory;
var ssItem = inv_grid[# 0, selectedSlot];
var createNotificaions = false;

if (pickupSlot != -1){ //if we pick something up
	if (mouse_check_button_pressed(mb_left)){
		if (!mouseInInventory){
#region drop item into game world
		createNotificaions = true;

		var pitem = inv_grid[# 0, pickupSlot];
		var in = pitem;
		
		inv_grid[# 1, pickupSlot] -= 1;
		
		//destroy item in inventiry if it was the last one
		if (inv_grid[# 1, pickupSlot] == 0){
			inv_grid[# 0, pickupSlot] = item.none;
			pickupSlot = -1;
		}
		
		//create the item
		var inst = instance_create_layer(oPlayer.x , oPlayer.y, "Instances", oItems);
		with (inst){
			itemNum = pitem;
			xFrame = itemNum mod (sprWidth/cellSize);
			yFrame = itemNum div (sprWidth/cellSize);
		}
		show_debug_message("Dropped an item");
#endregion
		} else if (ssItem == item.none){
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
		createNotificaions = true;
		var in = inv_grid[# 0, selectedSlot];
		
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

if (createNotificaions){
#region Create Notification
if (!instance_exists(oNotifications)){
	instance_create_layer(0, 0, "Instances", oNotifications);
}

with (oNotifications){
	if (!ds_exists(ds_notifications, ds_type_grid)){
		ds_notifications = ds_grid_create(2, 1);
		var not_grid = ds_notifications;
		not_grid[# 0, 0] = -1;
		not_grid[# 1, 0] = Inventory.ds_items_info[# 0, in];
	} else {
		//Add to grid
		event_perform(ev_other, ev_user0);
						
		var not_grid = ds_notifications;
		var grid_heigh = ds_grid_height(not_grid);
		var name = Inventory.ds_items_info[# 0, in];
		var in_grid = false;
						
		var yy = 0;
		repeat(grid_heigh){
			if (name == not_grid[# 1, yy]){
				not_grid[# 0, yy] -= 1;
				in_grid =true;
				break;
				}
						
			yy++;
			}
					
		if (!in_grid){
			ds_grid_resize(not_grid, 2, grid_heigh*1);
			not_grid[# 0, grid_heigh] = -1;
			not_grid[# 1, 0] = Inventory.ds_items_info[# 0, in];
		}
	}
}

#endregion
}
