var xx = argument0;
var yy = argument1;
var obj = argument2;

var instance = instance_create_layer(WorldX(xx, yy), WorldY(xx, yy) - objMap.tileHeight, objControl.layerUnits, obj);
instance.depthOverride = true;
return instance;