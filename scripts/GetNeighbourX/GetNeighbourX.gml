
// argument1 xx
// argument2 yy
// dir

if (argument1 mod 2 == 0) { // EVEN Y
	switch (argument2) {
		case TOP_LEFT:
			return argument0 - 1;
		
		case TOP_RIGHT:
			return argument0;
			
		case BOTTOM_RIGHT:
			return argument0;
			
		case BOTTOM_LEFT:
			return argument0 - 1;
	}
} else {
	switch (argument2) {
		case TOP_LEFT:
			return argument0;
		
		case TOP_RIGHT:
			return argument0 + 1;
			
		case BOTTOM_RIGHT:
			return argument0 + 1;
			
		case BOTTOM_LEFT:
			return argument0;
	}
}