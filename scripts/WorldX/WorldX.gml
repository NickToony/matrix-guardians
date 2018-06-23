var offset = 0;
if (argument1 mod 2 != 0) {
	offset = objMap.tileWidth;	
}
return argument0 * objMap.tileWidth*2 + offset;