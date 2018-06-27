event_inherited();

image_blend = (active || clicked) ? c_white : c_gray;

if (active) {
	if (objMap.tool != activeTool) {
		active = false;	
	}
}

if (!clicked && !ds_list_empty(items)) {
	for (var i = 0; i < ds_list_size(items); i ++) {
		var item = ds_list_find_value(items, i);
		with (item) {
			if (active) {
				other.active = true;	
				other.activeIcon = icon;
				other.activeText = text;
				other.activeTool = tool;
			}
			instance_destroy();	
		}
	}
	ds_list_clear(items);
}

if (clicked && ds_list_empty(items)) {
	for (var i = 0; i < array_length_1d(buttons); i ++) {
		var instance = instance_create_layer(x, y - ((sprite_height + spacing) * (i + 1)), objControl.layerUI, buttons[i]);
		instance.image_xscale = image_xscale;
		instance.image_yscale = image_yscale;
		ds_list_add(items, instance);
	}
}