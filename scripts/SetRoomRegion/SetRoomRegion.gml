var xx = argument0;
var yy = argument1;
var type = argument2;
var width = argument3;
var height = argument4;

var  x1, y1, x2, y2;
var  xx1, yy1, xx2, yy2;

SetTileRoom(xx, yy, type);

x1 = xx;
y1 = yy;
repeat (width) {
	x2 = GetNeighbourX(x1, y1, BOTTOM_LEFT);
	y2 = GetNeighbourY(x1, y1, BOTTOM_LEFT);
	
	SetTileRoom(x2, y2, type);
	
	xx1 = x2;
	yy1 = y2;
	repeat(height) {
		xx2 = GetNeighbourX(xx1, yy1, BOTTOM_RIGHT);
		yy2 = GetNeighbourY(xx1, yy1, BOTTOM_RIGHT);
	
		SetTileRoom(xx2, yy2, type);
	
		xx1 = xx2;
		yy1 = yy2;
	}
	
	xx1 = x2;
	yy1 = y2;
	repeat(height) {
		xx2 = GetNeighbourX(xx1, yy1, TOP_LEFT);
		yy2 = GetNeighbourY(xx1, yy1, TOP_LEFT);
	
		SetTileRoom(xx2, yy2, type);
	
		xx1 = xx2;
		yy1 = yy2;
	}
	
	x1 = x2;
	y1 = y2;
}

x1 = xx;
y1 = yy;
repeat (width) {
	x2 = GetNeighbourX(x1, y1, TOP_RIGHT);
	y2 = GetNeighbourY(x1, y1, TOP_RIGHT);
	
	SetTileRoom(x2, y2, type);
	
	xx1 = x2;
	yy1 = y2;
	repeat(height) {
		xx2 = GetNeighbourX(xx1, yy1, BOTTOM_RIGHT);
		yy2 = GetNeighbourY(xx1, yy1, BOTTOM_RIGHT);
	
		SetTileRoom(xx2, yy2, type);
	
		xx1 = xx2;
		yy1 = yy2;
	}
	
	xx1 = x2;
	yy1 = y2;
	repeat(height) {
		xx2 = GetNeighbourX(xx1, yy1, TOP_LEFT);
		yy2 = GetNeighbourY(xx1, yy1, TOP_LEFT);
	
		SetTileRoom(xx2, yy2, type);
	
		xx1 = xx2;
		yy1 = yy2;
	}
	
	x1 = x2;
	y1 = y2;
}

xx1 = xx;
yy1 = yy;
repeat(height) {
	xx2 = GetNeighbourX(xx1, yy1, BOTTOM_RIGHT);
	yy2 = GetNeighbourY(xx1, yy1, BOTTOM_RIGHT);
	
	SetTileRoom(xx2, yy2, type);
	
	xx1 = xx2;
	yy1 = yy2;
}
	
xx1 = xx;
yy1 = yy;
repeat(height) {
	xx2 = GetNeighbourX(xx1, yy1, TOP_LEFT);
	yy2 = GetNeighbourY(xx1, yy1, TOP_LEFT);
	
	SetTileRoom(xx2, yy2, type);
	
	xx1 = xx2;
	yy1 = yy2;
}