var xx = argument0;
var yy = argument1;
var type = argument2;
var spr = argument3;


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
tile.row.redraw = true;

ds_list_add(global.ROOMS[type], [xx, yy]);

return true;