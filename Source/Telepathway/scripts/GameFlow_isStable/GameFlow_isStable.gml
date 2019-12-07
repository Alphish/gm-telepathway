/// @function GameFlow_isStable()

with (par_Actor) {
	is_idle = current_direction == undefined && remaining_path == "" && !performs_attack;
}
with (par_Actor) {
	if (!is_idle)
		return false;
}

if (is_poked)
	return false;

return true;