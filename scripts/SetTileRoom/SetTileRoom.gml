var xx = argument0;
var yy = argument1;
var type = argument2;
var spr = GetSpriteForRoom(type);


var tile = GetTile(xx, yy);
if (tile == noone) {
	return false;	
}

if (tile.roomType != noone) {
	for (var i = 0; i < ds_list_size(global.ROOMS[tile.roomType]); i ++) {
		var val = ds_list_find_value(global.ROOMS[tile.roomType], i);
		if (xx == val[0] && yy = val[1]) {
			ds_list_delete(global.ROOMS[tile.roomType], i);
			break;
		}
	}
}

tile.roomType = type;
tile.roomSprite = spr;

ds_list_add(global.ROOMS[type], [xx, yy]);

RecalcNeighbours(tile); 
RecalcNeighbours(tile.topLeft);
RecalcNeighbours(tile.topRight);
RecalcNeighbours(tile.bottomLeft);
RecalcNeighbours(tile.bottomRight);

with (objMetals) {
	stored = true;
	alarm[0] = 1;
}

return true;