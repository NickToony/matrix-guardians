var tile = argument0;
var neighbour;

repeat (10) {
	neighbour = GetTileNeighbour(tile, choose(TOP_RIGHT, TOP_LEFT, BOTTOM_RIGHT, BOTTOM_LEFT));
	if (neighbour != noone && !neighbour.solid) {
		return neighbour;
	}
}

return noone;