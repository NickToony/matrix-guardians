var xx = argument0;
var yy = argument1;
var type = argument2;
var spr = argument3;


var tile = GetTile(xx, yy);
if (tile == noone) {
	return false;	
}

tile.roomType = type;
tile.roomSprite = spr;
tile.row.redraw = true;
return true;