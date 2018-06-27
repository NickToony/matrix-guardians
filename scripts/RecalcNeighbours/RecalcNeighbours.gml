if (argument0 == noone) return;

argument0.topLeft = GetTileDirection(argument0.gridX, argument0.gridY, TOP_LEFT);
argument0.topRight = GetTileDirection(argument0.gridX, argument0.gridY, TOP_RIGHT);
argument0.bottomLeft = GetTileDirection(argument0.gridX, argument0.gridY, BOTTOM_LEFT);
argument0.bottomRight = GetTileDirection(argument0.gridX, argument0.gridY, BOTTOM_RIGHT);
argument0.accessible = (argument0.topLeft != noone && !argument0.topLeft.solid)
	||  (argument0.topRight != noone && !argument0.topRight.solid)
	||  (argument0.bottomLeft != noone && !argument0.bottomLeft.solid)
	||  (argument0.bottomRight != noone && !argument0.bottomRight.solid);
argument0.connected = argument0.connectable
	|| (argument0.topLeft != noone && argument0.topLeft.connectable)
	||  (argument0.topRight != noone && argument0.topRight.connectable)
	||  (argument0.bottomLeft != noone && argument0.bottomLeft.connectable)
	||  (argument0.bottomRight != noone && argument0.bottomRight.connectable);
//argument0.isVisible = argument0.accessible
//	|| (argument0.topLeft != noone && argument0.topLeft.accessible)
//	||  (argument0.topRight != noone && argument0.topRight.accessible)
//	||  (argument0.bottomLeft != noone && argument0.bottomLeft.accessible)
//	||  (argument0.bottomRight != noone && argument0.bottomRight.accessible);;
	
argument0.isVisible = argument0.accessible ? 3 : 0;
if (argument0.topLeft != noone) argument0.isVisible = max(argument0.isVisible, argument0.topLeft.isVisible-1);
if (argument0.topRight != noone) argument0.isVisible = max(argument0.isVisible, argument0.topRight.isVisible-1);
if (argument0.bottomLeft != noone) argument0.isVisible = max(argument0.isVisible, argument0.bottomLeft.isVisible-1);
if (argument0.bottomRight != noone) argument0.isVisible = max(argument0.isVisible, argument0.bottomRight.isVisible-1);
	

argument0.row.redraw = true;