/// @description Add Instances to Grid and Draw

//Check if grid exists
if(ds_exists(ds_depthgrid, ds_type_grid)) {
	//get the number of instances (number of children)
	var instNum = instance_number(objDepth);
	
	var camera = objCamera;
	var x1 = camera.x1 - camera.bx; 
	var y1 = camera.y1 - camera.by; 
	var x2 = camera.x2 + camera.bx; 
	var y2 = camera.y2 + camera.by; 
		
	//make ds_depthgrid local and accessable to our instances (all children of depth parent)
	var depthgrid = ds_depthgrid;
	
	if (instNum == 0) {
		return;
	}
	
	//resize the grid to the number of instances/children
	ds_grid_resize(depthgrid, 2, instNum);
	
	//declare a local variable we will increment with each loop when adding children to grid
	var yy = 0;
	
	//add all the instances/children to the grid, and their corresponding y value
	with(objDepth){
		if ( object_index == objRow) ||
		((x > (x1)) 
		&& (y > (y1)) 
		&& (x < (x2)) 
		&& (y < (y2)) ) {
			depthgrid[# 0,yy] = id;
			depthgrid[# 1,yy] = depth;
			yy += 1;
		}
	}
	
	// Resize to current instances
	instNum = yy;
	ds_grid_resize(depthgrid, 2, instNum);
	
	//sort the grid in ascending order (lowest Y will be at the top)
	ds_grid_sort(ds_depthgrid, 1, true);
	//show_debug_message(instNum);
	
	//use repeat to loop through the grid, starting at height = 0, drawing the instance,
	//and then incrementing yy for the next loop, to draw the next instance in the grid
	yy = 0;
	repeat(instNum) {
		var instanceID = ds_depthgrid[# 0, yy];
		with(instanceID) { 
			if (object_index == objRow) {
				DrawSmartRow();
			} else {
				draw_self();
			}
		}
		yy+=1;
	}
}