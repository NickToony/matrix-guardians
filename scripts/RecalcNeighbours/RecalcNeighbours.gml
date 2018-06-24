if (argument0 == noone) return;

argument0.topLeft = GetTileDirection(argument0.gridX, argument0.gridY, TOP_LEFT);
argument0.topRight = GetTileDirection(argument0.gridX, argument0.gridY, TOP_RIGHT);
argument0.bottomLeft = GetTileDirection(argument0.gridX, argument0.gridY, BOTTOM_LEFT);
argument0.bottomRight = GetTileDirection(argument0.gridX, argument0.gridY, BOTTOM_RIGHT);

argument0.row.redraw = true;