var anim_length = 9;
var frame_size = 64;
var anim_speed = 12;

if (moveX < 0) y_frame = 9;
else if (moveX > 0) y_frame = 11;
else if (moveY < 0) y_frame = 8;
else if (moveY > 0) y_frame = 10;
else x_frame = 0;

var xx = x - x_offset,
var yy = y - y_offset;


if (x_frame + (anim_speed/60) < anim_length){
	x_frame += anim_speed/60;
}
else { x_frame = 1; }


draw_sprite_part(sBody, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

draw_sprite_part(sHair, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

draw_sprite_part(sTorso, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

draw_sprite_part(sLegs, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

draw_sprite_part(sFeet, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);
