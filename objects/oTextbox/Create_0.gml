box = spr_textbox;
frame = spr_portrait_frame_strip2;
portrait = spr_portraits_strip8;
namebox = spr_namebox;

box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
portrait_width = sprite_get_width(portrait);
portrait_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);

portX = (global.game_width - box_width - portrait_width) * 0.5;
portY = (global.game_height * 0.98) - portrait_height;
boxX = portX + portrait_width;
boxY = portY;
nameboxX = portX;
nameboxY = boxY - namebox_height;

xBuffer = 12;
yBuffer = 8;
textX = boxX + xBuffer;
textY = boxY + yBuffer;
nameTextX = nameboxX + (namebox_width/2);
nameTextY = nameboxY + (namebox_height/2); 

portraitIndex = 0;

text = " WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW";
name = "name";

text_col = c_black;
font = inf_font_12;