var xx = argument0;
var yy = argument1;
var obj = argument2;
var size = argument3;



while (size > 0) {	
	var tile = GetTile(xx, yy);
	if (tile != noone && tile.object_index == obj) {
		size += 1;	
	}
	SetTile(xx, yy, obj);
	
	var dir = choose(TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT);
	var xnew = GetNeighbourX(xx, yy, dir);
	var ynew = GetNeighbourY(xx, yy, dir);
	xx = xnew;
	yy = ynew;

	size -= 1;
}