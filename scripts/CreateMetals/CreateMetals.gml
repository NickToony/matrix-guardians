var gridX = WorldX(argument0, argument1);
var gridY = WorldY(argument0, argument1);

var instance = instance_create_layer(gridX, gridY, objControl.layerUnits, objMetals);
instance.metals = argument2;
instance.gridX = argument0;
instance.gridY = argument1;
return instance;