//------Inventory back
if (!showInventory)	{ exit; }
draw_sprite_part_ext(sInv_UI, 0, cellSize, 0,
	invUIWidth, invUIHeight, invUI_x, invUI_y, scale, scale, c_white, 1);
	
	var info_grid = ds_player_info;

draw_set_font(inf_font_24);
var c = c_black;
draw_text_color(infoX, infoY, info_grid[# 0, 3] + ": " + info_grid[# 1, 3], c, c, c, c, 1);

draw_set_font(inf_font_smalldigits);
var yy = 0;
repeat(3){
	draw_text_color(infoX + (192*scale) + ((15+18)*scale*yy),
		infoY, string(info_grid[# 1, yy]), c, c, c, c, 1);
	yy += 1;
}

var ii, ix, iy, xx, yy, iitem, invGrid;
ii = 0; ix = 0; iy = 0;
invGrid = ds_inventory;
// Inventory
repeat(invSlots){
	//x, y location for slot
	xx = slotsX + ((cellSize+xBuffer) * ix*scale);
	yy = slotsY + ((cellSize + yBuffer) * iy*scale);
	
	// item
	iitem = invGrid[# 0, ii];
	sx = (iitem mod sprInvColumns)*cellSize;
	sy = (iitem div sprInvColumns)*cellSize;

	//draw slot and item
	draw_sprite_part_ext(sInv_UI, 0, 0, 0, cellSize, cellSize, xx, yy, scale, scale, c_white, 1);
	if (iitem > 0) {
	draw_sprite_part_ext(
		sInvItems, 0, sx, sy, cellSize, cellSize, xx, yy, scale, scale, c_white, 1);
	}
	
	//draw item number
	if (iitem > 0) {
		var number = invGrid[# 1, ii];
		draw_text_color(xx, yy, string(number), c, c, c, c, 1);
	}
	
	//incrememnt
	ii+= 1;
	ix = ii mod invSlotsWidth;
	iy = ii div invSlotsWidth;
}