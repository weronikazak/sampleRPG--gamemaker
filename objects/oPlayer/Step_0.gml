input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);
input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);

if (input_walk or input_run){
	spd = abs((input_walk*w_spd) - (input_run*r_spd));
} else spd = h_spd;

moveX = 0;
moveY = 0;

moveY = (input_down - input_up) * spd;
if (moveY == 0) moveX = (input_right - input_left) * spd;

if (moveX != 0){
	if (place_meeting(x + moveX, y, oCollision)){
		repeat(abs(moveX)){
			if (!place_meeting(x + sign(moveX), y, oCollision)){
			x += sign(moveX);
			} else break;
		}
		moveX = 0;
	}
}

if (moveY != 0){
	if (place_meeting(x, y + moveY, oCollision)){
		repeat(abs(moveY)){
			if (!place_meeting(x, y + sign(moveY), oCollision)){
			y += sign(moveY);
			} else break;
		}
		moveY = 0;
	}
}

x += moveX;
y += moveY;