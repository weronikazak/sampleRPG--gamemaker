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
xMaxWidth = box_width - (2*xBuffer);
xMaxWidth = box_width - (2*xBuffer);
textMaxWidth = box_width - (2 * xBuffer);

portraitIndex = 0;
counter = 0;
interact_key = ord("E");
voice = snd_voice1;
pause = false;

text[0] = "";
page = 0;
name = "name";

text_col = c_black;
font = inf_font_12;
draw_set_font(font);
textHeight = string_height("M");

//event_perform(ev_other, ev_user1);