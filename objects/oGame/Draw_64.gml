if (doTransition){
	if (room != spawnRoom) {
		blackAlpha += 0.1;
		if (blackAlpha >= 1) room_goto(spawnRoom);
	} else {
		blackAlpha -= 0.1;
		if (blackAlpha <= 0) doTransition = false;
	}
	//Draw black fade
	draw_set_alpha(blackAlpha);
	draw_rectangle_colour(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}

