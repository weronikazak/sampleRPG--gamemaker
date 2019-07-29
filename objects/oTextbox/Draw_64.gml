//draw box
draw_sprite(box, 0, boxX, boxY);

//draw portrait back
draw_sprite(frame, 0, portX, portY);

//draw portrait
draw_sprite(portrait, portraitIndex, portX, portY);

//draw portrait frame
draw_sprite(frame, 1, portX, portY);

//draw namebox
draw_sprite(namebox, 0, nameboxX, nameboxY);


//-----TEXT
draw_set_font(font);
var c = text_col;
// draw name
draw_set_halign(fa_center); draw_set_halign(fa_middle); 
draw_text_color(nameTextX, nameTextY, name, c, c, c, c, 1);
draw_set_halign(fa_left); draw_set_halign(fa_top); 

//draw text
var c = text_col;
draw_text_ext_color(textX, textY, text[page], textHeight, textMaxWidth, c, c, c, c, 1);
