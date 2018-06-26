/// @param xFrom
/// @param yFrom
/// @param targetX
/// @param targetY

var startX = argument0;
var startY = argument1;
var targetX = argument2;
var targetY = argument3;
var allowSolidTarget = argument4;

var currentTile = GetTile(startX, startY);
var targetTile = GetTile(targetX, targetY);

if (currentTile == noone || currentTile.solid) {
	show_debug_message("On non-accessible tile");
	return noone;
}

if (!allowSolidTarget && (targetTile == noone || targetTile.solid)) {
	show_debug_message("Trying to get to non-accessible tile");
	return noone;
}

if (startX == targetX && startY == targetY) {
	show_debug_message("Already there...");
	var result = ds_stack_create();
	ds_stack_push(result, [targetTile.gridX, targetTile.gridY]);
	return result;
}

var closedSet = ds_list_create();
var openSet = ds_priority_create();
var cameFrom = ds_map_create();
var gScore = ds_map_create();
var fScore = ds_map_create();

// Add initial node
ds_priority_add(openSet, currentTile, 1);
ds_map_add(gScore, currentTile, 0);
ds_map_add(fScore, currentTile, point_distance(startX, startY, targetX, targetY));

while (!ds_priority_empty(openSet)) {
	// Get node with lowest cost
	var currentNode = ds_priority_find_min(openSet);
	
	// If it's the target
	if (currentNode == targetTile) {
		// Don't include the target sometimes
		if (allowSolidTarget) {
			currentNode = ds_map_find_value(cameFrom, currentNode);	
		}
		
		// Construct the path
		var path = ds_stack_create();
		while (currentNode != currentTile) {
			// Add node to path
			ds_stack_push(path, [currentNode.gridX, currentNode.gridY]);
			// Find the next node in the path
			currentNode = ds_map_find_value(cameFrom, currentNode);
		}
		
		ds_stack_push(path, [currentTile.gridX, currentTile.gridY]); 
		
		// Cleanup
		ds_priority_destroy(openSet);
		ds_list_destroy(closedSet);
		ds_map_destroy(cameFrom);
		ds_map_destroy(gScore);
		ds_map_destroy(fScore);
		
		return path;
	}
	
	ds_priority_delete_min(openSet);
	ds_list_add(closedSet, currentNode);
	
	for (var i = 0; i <= 3; i ++) {
		var neighbour = GetTileNeighbour(currentNode, i);
	
		// Check if it's solid!
		if (neighbour == noone || neighbour.solid) {
			if (allowSolidTarget && neighbour == targetTile) {
				// We allow it!
			} else {
				// It is! ignore it
				continue;
			}
		}
	
		// Check if it's in closed list
		if (ds_list_find_index(closedSet, neighbour) != -1) {
			// It is! ignore it
			continue;
		}
		
		
		// Calculate the gscore from the node to the neighbour
		var nodeGscore = ds_map_find_value(gScore, currentNode) + point_distance(currentNode.gridX, currentNode.gridY, neighbour.gridX, neighbour.gridY);
		// If the neighbour already has a better route
		if (ds_map_find_value(gScore, neighbour) != undefined && nodeGscore >= ds_map_find_value(gScore, neighbour)) {
			// Add to open list with a very bad priority
			if (ds_priority_find_priority(openSet, neighbour) == undefined) {
				// It's not! Add it!
				ds_priority_add(openSet, neighbour, 9999);
			}
		
			// this isn't a worthwhile path
			continue;
		}
		
		// Best path!
		ds_map_replace(cameFrom, neighbour, currentNode);
		ds_map_replace(gScore, neighbour, nodeGscore);
		// Calculate fscore from neighbour to goal
		var nodeFscore = nodeGscore  + point_distance(neighbour.gridX, neighbour.gridY, targetX, targetY);
		ds_map_replace(fScore, neighbour, nodeFscore);
		
		// Add to open set with good priority
		if (ds_priority_find_priority(openSet, neighbour) == undefined) {
			ds_priority_add(openSet, neighbour, nodeFscore);
		}
	}
}

// Cleanup
ds_priority_destroy(openSet);
ds_list_destroy(closedSet);
ds_map_destroy(cameFrom);
ds_map_destroy(gScore);
ds_map_destroy(fScore);

return noone;
