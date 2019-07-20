draw_sprite_part(
	spr_crops, 0, growthStage*frameWidth,
	cropType * frameHeight, frameWidth, frameHeight, xx, yy
);

if (sparkle >= 0){
	draw_sprite(spr_sparkle_strip5, sparkle, x-2, y-10);
	sparkle += .1;
	if (sparkle >= sprite_get_number(spr_sparkle_strip5)){
		sparkle = -1;
		alarm[1] = random_range(4, 5) * room_speed;
	}
}