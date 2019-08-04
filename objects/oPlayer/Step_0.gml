input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);
input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);
input_interact = keyboard_check_pressed(vk_space);

if (input_walk or input_run){
	spd = abs((input_walk*w_spd) - (input_run*r_spd));
} else spd = h_spd;

moveX = 0;
moveY = 0;

moveY = (input_down - input_up) * spd;
if (moveY == 0) moveX = (input_right - input_left) * spd;

// get direction player
if (moveX != 0) {
	switch (sign(moveX)){
		case 1: facing = dir.right; break;
		case -1: facing = dir.left; break;
	}
} else if (moveY !=0) {
	switch (sign(moveY)){
		case 1: facing = dir.down; break;
		case -1: facing = dir.up; break;
	}
} else {
	facing = -1;
}

//Check collision

if (moveX != 0){
	var collisionX = instance_place(x + moveX, y, oCollision);
	if (collisionX != noone and collisionX.collideable == true){
		repeat(abs(moveX)){
			if (!place_meeting(x + sign(moveX), y, oCollision)){
			x += sign(moveX);
			} else break;
		}
		moveX = 0;
	}
}

if (moveY != 0){
	var collisionY = instance_place(x, y + moveY, oCollision);
	if (collisionY != noone and collisionY.collideable == true){
		repeat(abs(moveY)){
			if (!place_meeting(x, y + sign(moveY), oCollision)){
			y += sign(moveY);
			} else break;
		}
		moveY = 0;
	}
}

//Check for transitions

var inst = instance_place(x, y, oTransform);
if (inst != noone and facing == inst.playerFacingBefore) {
	with (oGame) {
		if (!doTransition){
			spawnRoom = inst.targetroom;
			spawnX = inst.targetX;
			spawnY = inst.targetY;
			spawnPlayerFacing = inst.playerFacingAfter;
			doTransition = true;
		}
	}
}

//textbox
if (input_interact){
	
	if (active_textbox == noone){
		var inst = collision_rectangle(x-radius, y-radius, x+ radius, y+radius, oNPC, false, false);

		if (inst != noone){
			with (inst){
				var tbox = create_textbox(text, speakers, nextLine, scripts);
				canMove = false;
				moveX = 0;
				moveY = 0;
			}
			active_textbox = tbox;
		}
	} else {
		if (!instance_exists(active_textbox)){
			active_textbox = noone;
		}
	}
}

//apply movement
x += moveX;
y += moveY;