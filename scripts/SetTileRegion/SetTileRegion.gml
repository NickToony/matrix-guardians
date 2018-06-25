var xx = argument0;
var yy = argument1;
var obj = argument2;
var width = argument3;
var height = argument4;

var  x1, y1, x2, y2;
var  xx1, yy1, xx2, yy2;

SetTile(xx, yy, obj);

x1 = xx;
y1 = yy;
repeat (width) {
	x2 = GetNeighbourX(x1, y1, BOTTOM_LEFT);
	y2 = GetNeighbourY(x1, y1, BOTTOM_LEFT);
	
	SetTile(x2, y2, obj);
	
	xx1 = x2;
	yy1 = y2;
	repeat(height) {
		xx2 = GetNeighbourX(xx1, yy1, BOTTOM_RIGHT);
		yy2 = GetNeighbourY(xx1, yy1, BOTTOM_RIGHT);
	
		SetTile(xx2, yy2, obj);
	
		xx1 = xx2;
		yy1 = yy2;
	}
	
	xx1 = x2;
	yy1 = y2;
	repeat(height) {
		xx2 = GetNeighbourX(xx1, yy1, TOP_LEFT);
		yy2 = GetNeighbourY(xx1, yy1, TOP_LEFT);
	
		SetTile(xx2, yy2, obj);
	
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
	
	SetTile(x2, y2, obj);
	
	xx1 = x2;
	yy1 = y2;
	repeat(height) {
		xx2 = GetNeighbourX(xx1, yy1, BOTTOM_RIGHT);
		yy2 = GetNeighbourY(xx1, yy1, BOTTOM_RIGHT);
	
		SetTile(xx2, yy2, obj);
	
		xx1 = xx2;
		yy1 = yy2;
	}
	
	xx1 = x2;
	yy1 = y2;
	repeat(height) {
		xx2 = GetNeighbourX(xx1, yy1, TOP_LEFT);
		yy2 = GetNeighbourY(xx1, yy1, TOP_LEFT);
	
		SetTile(xx2, yy2, obj);
	
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
	
	SetTile(xx2, yy2, obj);
	
	xx1 = xx2;
	yy1 = yy2;
}
	
xx1 = xx;
yy1 = yy;
repeat(height) {
	xx2 = GetNeighbourX(xx1, yy1, TOP_LEFT);
	yy2 = GetNeighbourY(xx1, yy1, TOP_LEFT);
	
	SetTile(xx2, yy2, obj);
	
	xx1 = xx2;
	yy1 = yy2;
}