if (keyboard_check_pressed(interact_key)){
	if (!choice_dialogue and counter < str_len) {
		counter = str_len;
	}
	else if (page < array_length_1d(text) -1){
		var line = nextLine[page];
		
		if (choice_dialogue) line = line[choice];
		
		if (line == 0){
			page++;
		}
		else if (line == -1) {
			instance_destroy();
		} else {
			page = line;
		}	
		event_perform(ev_other, ev_user1);
		
	} else {
		instance_destroy();
	}	
}

if (choice_dialogue){
	choice += keyboard_check(vk_down) - keyboard_check_pressed(vk_up);
	
	if (choice > text_array_len - 1) choice = 0;
	if (choice < 0 ) choice = text_array_len - 1;
}