var inst_num = instance_number(parDepthObject);
var dsgrid = ds_depthgrid;

ds_grid_resize(dsgrid, 2, inst_num);

var yy = 0;
with (parDepthObject){
	dsgrid[# 0, yy] = id;
	dsgrid[# 1, yy] = y;
	yy += 1;
}

//sort the grid in ascending order
ds_grid_sort(dsgrid, 1, true);

//loop through the grid and draw all the instances
var inst;
var yy = 0;
repeat(inst_num){
	//pull out an id
	inst = dsgrid[# 0, yy];
	//draw yourself
	with (inst) {
		event_perform(ev_draw, 0);
	}
	
	yy += 1;
}
