depth = -1;
scale = 2;
cellSize = 32;
showInventory = true;

invSlots = 16;
invSlotsWidth = 8;
invSlotsHeight = 3;

xBuffer = 2;
yBuffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

sInv_UI = spr_inventory_UI;
sInvItems = spr_inventory_items;

sprInvColumns = sprite_get_width(sInvItems)/cellSize;
sprInvRows = sprite_get_height(sInvItems)/cellSize;

invUIWidth = 288;
invUIHeight = 192;


invUI_x = (gui_width * 0.5) - (invUIWidth * 0.5 * scale);
invUI_y = (gui_height * 0.5) - (invUIHeight * 0.5 * scale);

infoX = invUI_x + (9 * scale);
infoY = invUI_y + (9 * scale);

slotsX = infoX;
slotsY = invUI_y + (40 * scale)

// Player info
// 0 GOLD
// 1 SILVER
// 2 BRONZE
// 3 NAME

ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Copper";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = irandom_range(0, 99);
ds_player_info[# 1, 1] = irandom_range(0, 99);
ds_player_info[# 1, 2] = irandom_range(0, 99);
ds_player_info[# 1, 3] = "Player";

// Inventory
// 0 ITEM
// 1 NUMBER

ds_inventory = ds_grid_create(2, invSlots);

//Items
enum item {
	none = 0,
	tomato = 1,
	potato = 2,
	carrot = 3,
	artichoke = 4,
	chilli = 5,
	gourd = 6,
	corn = 7,
	wood = 8,
	stone = 9,
	bucket = 10,
	chair = 11,
	picture = 12,
	axe = 13,
	potion = 14,
	starfish = 15,
	mushroom = 16,
	height = 17
}

ds_inventory[# 0, 0] = item.bucket;
ds_inventory[# 1, 0] = 1;

var yy = 0;
repeat(invSlots){
	ds_inventory[# 0, yy] = irandom_range(1, item.height-1);
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	yy += 1;
}