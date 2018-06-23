if (argument0 == noone) return;

var tile = GetTileDirection(gridX, gridY, argument1);
if (tile != noone && tile.solid) return;

var xx = 0, yy = 0, ind = 0;
var width = objMap.tileWidth/4;
var height = objMap.tileHeight/4;
var offsetX = 22;
var offsetY = 22;
var sprite = argument0;

switch (argument1) {
	case objMap.BOTTOM_LEFT:
	//xx = -width - offsetX;
	//yy = height - offsetY;
	xx = -40;
	yy = 0;
	break;
	
	case objMap.BOTTOM_RIGHT:
	//xx = width + offsetX;
	//yy = height - 28;
	xx = 40;
	yy = 0;
	ind = 1;
	break;
	
	case objMap.TOP_LEFT:
	//xx = -width - offsetX;
	//yy = -height - 54;
	xx = -40;
	yy = -57;
	ind = 0;
	sprite = sprWallTop;
	break;
	
	case objMap.TOP_RIGHT:
	//xx = width + offsetX;
	//yy = -height - 52;
	xx = 40;
	yy = -57;
	ind = 1;
	sprite = sprWallTop;
	break;
}

draw_sprite(sprite, ind, x + xx, y + yy);