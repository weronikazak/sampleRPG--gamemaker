var anim_length = 9;
var frame_size = 64;
var anim_speed = 12;

	switch (facing){
		case dir.left: y_frame = 9; break;
		case dir.right: y_frame = 11; break;
		case dir.up: y_frame = 8; break;
		case dir.down: y_frame = 10; break;
		case -1: x_frame = 0; break;
	}

var xx = x - x_offset,
var yy = y - y_offset;

//draw characters shadow
if (ssShadow != -1) draw_sprite(ssShadow, 0, x, y);


if (x_frame + (anim_speed/60) < anim_length){
	x_frame += anim_speed/60;
}
else { x_frame = 1; }



if (sBody != -1) draw_sprite_part(sBody, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

if (sHair != -1) draw_sprite_part(sHair, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

if (sTorso != -1) draw_sprite_part(sTorso, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

if (sLegs != -1) draw_sprite_part(sLegs, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

if (sFeet != -1) draw_sprite_part(sFeet, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

