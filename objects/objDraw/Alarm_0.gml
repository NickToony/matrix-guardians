//if (os_browser == browser_not_a_browser) {
	alarm[0] = refreshRate;
	if (changed) {
		instance_deactivate_object(objBaseTile);
		changed = false;
	}
	//instance_activate_region(objCamera.x1 - objCamera.bx, 
	//	objCamera.y1  - objCamera.by, 
	//	objCamera.w + objCamera.bx*2, 
	//	objCamera.h + objCamera.by*2, 
	//	true);
//}