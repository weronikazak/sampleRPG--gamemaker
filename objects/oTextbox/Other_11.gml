
name = names[page];
voice = voices[page];
portraitIndex = portraits[page];

if (!is_array(text[page])){
	text_wrapped = string_wrap(text[page], textMaxWidth);
	str_len = string_length(text_wrapped);
	choice_dialogue = false;

} else {
	text_array = text[page];
	text_array_len = array_length_1d(text_array);
	choice_dialogue = true;
}
	counter = 0;
