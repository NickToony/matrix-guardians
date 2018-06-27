var cost = argument0;
global.STORED_METALS -= cost;
global.METALS -= cost;
global.SPENDABLE_METALS -= cost;
with (objMetals) {
	if (stored && metals > 0 && cost > 0) {
		var diff = min(metals, cost);
		metals -= diff;
		cost -= diff;
	}
}