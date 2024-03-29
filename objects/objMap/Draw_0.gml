if (selecting) {
	if (selectionRefresh <= 0) {
		RecalcSelection();
		toolCost = GetToolCost(tool, selection);
		if (toolCost > global.SPENDABLE_METALS) {
			selectionValid = false;
		}
		selectionRefresh = SELECTION_RATE;
	}
	selectionRefresh -= 1;
	
	DrawSelection(selection, selectionValid ? c_green : c_red);
	if (toolCost > 0) {
		draw_set_font(fntFloating);
		draw_set_color(toolCost <= global.STORED_METALS ? c_white : c_red);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text(mouse_x + 64, mouse_y, string(toolCost));	
	}
} else {
	
	var valid = true;
	var draw = false;
	switch (tool) {
		case TOOL.SPAWN:
			var tile = GetTile(objCamera.mouseTileX, objCamera.mouseTileY);
			valid = false;
			if (tile != noone && !tile.solid && tile.connected) {
				valid = true;
			}
			draw = true;
			break;
		case TOOL.OVERCLOCK:
			var instance = instance_nearest(mouse_x, mouse_y, objFriendlyUnit);
			valid = false;
			if (instance && point_distance(mouse_x, mouse_y, instance.x, instance.y) < 128) {
				valid = true;
				
			}
			draw = true;
			break;
		case TOOL.GENERATOR:
			draw = true;
			var tile = GetTile(objCamera.mouseTileX, objCamera.mouseTileY);
			valid = tile != noone && tile.object_index == objLavaTile && tile.connected;
			if (valid) {
				with (objGenerator) {
					if (gridX == tile.gridX && gridY == tile.gridY) {
						valid = false;	
					}
				}
			}
			break;
		case TOOL.TRAP:
			draw = true;
			var tile = GetTile(objCamera.mouseTileX, objCamera.mouseTileY);
			valid = tile != noone && tile.object_index == objFloorTile && tile.connected && tile.roomType == ROOM.NONE;
			break;
		case TOOL.DIG:
		case TOOL.STORAGE:
		case TOOL.CHARGE:
		case TOOL.BUILD:
		case TOOL.CANCEL:
		case TOOL.REMOVE:
		case TOOL.ASSEMBLY:
		case TOOL.ARCHIVE:
			draw = true;
			
		break;
	}
	
	if (draw) {
		var cost = GetToolCost(tool, noone);
		var xx = WorldX(objCamera.mouseTileX, objCamera.mouseTileY);
		var yy = WorldY(objCamera.mouseTileX, objCamera.mouseTileY);
		draw_sprite_ext(sprBlock, 0, xx, yy, 1, 1, 0, (cost <= global.STORED_METALS && valid) ? c_green : c_red, 0.3);
			
		if (cost > 0) {
			draw_set_font(fntFloating);
			draw_set_color(cost <= global.STORED_METALS ? c_white : c_red);
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_text(mouse_x + 64, mouse_y, string(cost));	
		}
	}
	
}