
#macro TOP_LEFT 0
#macro TOP_RIGHT 1
#macro BOTTOM_LEFT 2
#macro BOTTOM_RIGHT 3

mapWidth = 32;
mapHeight = mapWidth*2;
tileWidth = 181/2 - 0.5;
tileHeight = 137/2 - 5;

// Create tile grid
grid = ds_grid_create(mapWidth, mapHeight);
ds_grid_clear(grid, noone);

// Task lists
digTasks = ds_list_create();
floorTasks = ds_list_create();
wallTasks = ds_list_create();

// Create pathfinding grid
pathfinding = mp_grid_create(0, 0, mapWidth, mapHeight, 1, 1);

for (var xx = 0; xx < mapWidth; xx ++) {
	for (var yy = 0; yy < mapHeight; yy ++) {
		SetTile(xx, yy, objDirtBlock);
	}
}

// Make start patch
var clearX = 2;
var clearY = round(clearX * 2);
for (var xx = mapWidth/2-clearX; xx < mapWidth/2+clearX; xx ++) {
	for (var yy = mapHeight/2-clearY; yy < mapHeight/2+clearY; yy ++) {
		SetTile(xx, yy, objDirtFloor);
	}
}

// Make start wall patch
var clearX = 3;
var clearY = round(clearX * 2);
for (var xx = mapWidth/2-clearX; xx < mapWidth/2+clearX; xx ++) {
	for (var yy = mapHeight/2-clearY; yy < mapHeight/2+clearY; yy ++) {
		AddWallTask(xx, yy);
	}
}

// Base units
repeat (5)
	CreateUnit(mapWidth/2 - 2, mapHeight/2, objVoidling);

CreateBuilding(mapWidth/2, mapHeight/2, objGateway);

MoveCamera(WorldX(mapWidth/2, mapHeight/2), WorldY(mapWidth/2, mapHeight/2), true);