var xx = argument0;
var yy = argument1;
var obj = argument2;
var replaceFloor = argument3;

var instance = instance_create_layer(0, 0, objControl.layerBuildings, obj);
//yy += floor(instance.height/2);
//xx -= round(instance.width/2);
instance.x = WorldX(xx, yy);
instance.y = WorldY(xx, yy) - 10;
instance.depth = instance.y + objMap.tileHeight;
instance.gridX = xx;
instance.gridY = yy;

if (!replaceFloor) return instance;

SetTile(xx, yy, objBuildingTile);
if (instance.width == 2) {
	var fx, fy, tx, ty;
	fx = xx;
	fy = yy;
	
	// Top left
	tx = GetNeighbourX(fx, fy, TOP_LEFT);
	ty = GetNeighbourY(fx, fy, TOP_LEFT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
	
	// Top
	tx = GetNeighbourX(fx, fy, TOP_RIGHT);
	ty = GetNeighbourY(fx, fy, TOP_RIGHT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
	
	// Top right
	tx = GetNeighbourX(fx, fy, BOTTOM_RIGHT);
	ty = GetNeighbourY(fx, fy, BOTTOM_RIGHT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
} else if (instance.width >= 3) {
	var fx, fy, tx, ty;
	fx = xx;
	fy = yy;
	
	// Top left
	tx = GetNeighbourX(fx, fy, TOP_LEFT);
	ty = GetNeighbourY(fx, fy, TOP_LEFT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
	
	// Top left
	tx = GetNeighbourX(fx, fy, TOP_LEFT);
	ty = GetNeighbourY(fx, fy, TOP_LEFT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
	
	// Top
	tx = GetNeighbourX(fx, fy, TOP_RIGHT);
	ty = GetNeighbourY(fx, fy, TOP_RIGHT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
	
	// Top
	tx = GetNeighbourX(fx, fy, TOP_RIGHT);
	ty = GetNeighbourY(fx, fy, TOP_RIGHT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
	
	// Top right
	tx = GetNeighbourX(fx, fy, BOTTOM_RIGHT);
	ty = GetNeighbourY(fx, fy, BOTTOM_RIGHT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
	
	// Top right
	tx = GetNeighbourX(fx, fy, BOTTOM_RIGHT);
	ty = GetNeighbourY(fx, fy, BOTTOM_RIGHT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
	
	// Top right
	tx = GetNeighbourX(fx, fy, BOTTOM_LEFT);
	ty = GetNeighbourY(fx, fy, BOTTOM_LEFT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
	
	// Top left
	tx = GetNeighbourX(fx, fy, TOP_LEFT);
	ty = GetNeighbourY(fx, fy, TOP_LEFT);
	SetTile(tx, ty, objBuildingTile);
	fx = tx; fy = ty;
}

return instance;