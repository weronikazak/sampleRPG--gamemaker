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

// draw name
var c = text_col;
draw_set_halign(fa_center); draw_set_halign(fa_middle); 
draw_text_color(nameTextX, nameTextY, name, c, c, c, c, 1);
draw_set_halign(fa_left); draw_set_halign(fa_top); 


if (!choice_dialogue){
	
	//draw text
	if (!pause and counter < str_len){
		counter++;
		if (counter mod 4 == 0){
			audio_play_sound(voice, 10, false);
		}
	
		switch(string_char_at(text_wrapped, counter)){
			case ",": pause = true; alarm[1] = 15; break;
			case ".":
			case "?": 
			case "!": pause = true; alarm[1] = 25; break;
			default: break;
		}
	}

	var substr = string_copy(text_wrapped, 1, counter);

	c = text_col;
	draw_text_color(textX, textY, substr, c, c, c, c, 1);

} else {
	c = text_col;
	var i = 0;
	y_add = 0; //how large the text will be
	repeat(text_array_len){
		
		if (choice == i) {
			c = choice_col;
			draw_text_color(boxX + textMaxWidth, boxY + y_add, ">", c, c, c, c, 1);
		} else c = text_col;
		
		draw_text_ext_color(textX, textY+y_add, text_array[i], textHeight, textMaxWidth, c, c, c, c, 1);
		y_add += string_height_ext(text_array[i], textHeight, textMaxWidth);
		i++;
	}

}