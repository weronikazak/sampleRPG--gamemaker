if (!debug) exit;

with(oCollision){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, c_black, c_black, c_black, true);
}

with(oPlayer){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, c_black, c_black, c_black, true);
}