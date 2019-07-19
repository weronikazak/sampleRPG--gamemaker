roomWidth = room_width;
roomHeight = room_height;

if (spawnRoom == -1) exit;

oPlayer.x = spawnX;
oPlayer.y = spawnY;
oPlayer.facing = spawnPlayerFacing;

with (oPlayer) {
	switch (facing){
		case dir.left: y_frame = 9; break;
		case dir.right: y_frame = 11; break;
		case dir.up: y_frame = 8; break;
		case dir.down: y_frame = 10; break;
		case -1: x_frame = 0; break;
	}
}