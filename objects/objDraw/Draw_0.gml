/// @description Add Instances to Grid and Draw

//Check if grid exists
if(ds_exists(ds_depthgrid, ds_type_grid)){

	//make ds_depthgrid local and accessable to our instances (all children of depth parent)
	var depthgrid = ds_depthgrid;
	
	//get the number of instances (number of children)
	var instNum = instance_number(objDepth);
	
	if (instNum == 0) {
		return;
	}
	
	//resize the grid to the number of instances/children
	ds_grid_resize(depthgrid, 2, instNum);
	
	//declare a local variable we will increment with each loop when adding children to grid
	var yy = 0;
	
	//add all the instances/children to the grid, and their corresponding y value
	with(objDepth){
		depthgrid[# 0,yy] = id;
		depthgrid[# 1,yy] = (y) ;
		yy += 1;
	}
	
	//sort the grid in ascending order (lowest Y will be at the top)
	ds_grid_sort(ds_depthgrid, 1, true);
	
	//use repeat to loop through the grid, starting at height = 0, drawing the instance,
	//and then incrementing yy for the next loop, to draw the next instance in the grid
	yy = 0; repeat(instNum){
		var instanceID = ds_depthgrid[# 0, yy];
		with(instanceID){ 
			
			if (object_is_ancestor(object_index, objBaseTile)) {
				draw_self();
				DrawWall(walled[objMap.TOP_LEFT], objMap.TOP_LEFT);
				DrawWall(walled[objMap.TOP_RIGHT], objMap.TOP_RIGHT);
				DrawWall(walled[objMap.BOTTOM_RIGHT], objMap.BOTTOM_RIGHT);
				DrawWall(walled[objMap.BOTTOM_LEFT], objMap.BOTTOM_LEFT);
				DrawWallCorners(walled);
			} else {
				draw_self();
			}
		}
		yy+=1;
	}
	
	//clear all cells of the grid to 0
	ds_grid_clear(ds_depthgrid, 0);
}