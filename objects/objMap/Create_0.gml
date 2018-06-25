#macro TOP_LEFT 0
#macro TOP_RIGHT 1
#macro BOTTOM_LEFT 2
#macro BOTTOM_RIGHT 3

#macro SELECTION_RATE 5
#macro SELECTION_RANGE 16

mapWidth = 32;
mapHeight = mapWidth*2;
tileWidth = 181/2 - 0.5;
tileHeight = 137/2 - 5;
fogOfWar = true;

selecting = false;
selection = noone;
selectionRefresh = 0;
mx = 0;
my = 0;

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
//var clearX = 2;
//var clearY = round(clearX * 2);
//for (var xx = mapWidth/2-clearX; xx <= mapWidth/2+clearX; xx ++) {
//	for (var yy = mapHeight/2-(clearY+1); yy <= mapHeight/2+clearY; yy ++) {
//		SetTile(xx, yy, objDirtFloor);
//	}
//}

while (instance_number(objLavaTile) < mapWidth) {
	SetTileVein(irandom(mapWidth), irandom(mapHeight), objLavaTile, 4 + irandom(4));	
}

while (instance_number(objMetalBlock) < mapHeight*2) {
	SetTileVein(irandom(mapWidth), irandom(mapHeight), objMetalBlock, 6 + irandom(6));	
}

SetTileRegion(mapWidth/2, mapHeight/2, objDirtFloor, 3, 3);

// Make start wall patch
var clearX = 4;
var clearY = round(clearX * 2);
for (var xx = mapWidth/2-clearX; xx <= mapWidth/2+clearX; xx ++) {
	for (var yy = mapHeight/2-(clearY+1); yy <= mapHeight/2+clearY; yy ++) {
		AddWallTask(xx, yy);
	}
}

// Base
CreateBuilding(mapWidth/2, mapHeight/2, objGateway);

// Base units
repeat (6)
	CreateUnitGateway(objRoomba);

MoveCamera(WorldX(mapWidth/2, mapHeight/2), WorldY(mapWidth/2, mapHeight/2), true);