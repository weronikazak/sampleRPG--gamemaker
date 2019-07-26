event_inherited();

cellSize = 32;
itemSpr = spr_inventory_items;
sprWidth = sprite_get_width(itemSpr);
sprHeight = sprite_get_height(itemSpr);

itemNum = -1;
xFrame = 0;
yFrame = 0;

xOffset = cellSize/2;
yOffset = cellSize*(2/3);

drop_move = true;
var itemdir = irandom_range(0, 259);
var len = 32;
goalX = x + lengthdir_x(len, itemdir);
goalY = y + lengthdir_y(len, itemdir);
