// FPS
room_speed = 60;
display_reset(0, true)

layerInstances = layer_get_id("Instances");
layerDepth = layer_get_id("Depth");

instance_create_layer(0, 0, layerInstances, objDraw);
instance_create_layer(0, 0, layerInstances, objMap);
instance_create_layer(0, 0, layerInstances, objCamera);

show_debug_overlay(true);