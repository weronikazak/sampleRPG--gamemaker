
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


x += moveX;
y += moveY;