/atom
	/// What is this atom's current temperature?
	var/temperature = T20C
	/// How rapidly does this atom equalize with ambient temperature?
	var/temperature_coefficient = MAX_TEMPERATURE_COEFFICIENT

/atom/movable/Entered(var/atom/movable/atom, var/atom/old_loc)
	. = ..()
	queue_temperature_atoms(atom)

/obj
	temperature_coefficient = null

/mob
	temperature_coefficient = null

/turf
	temperature_coefficient = MIN_TEMPERATURE_COEFFICIENT

// If this is a simulated atom, adjust our temperature.
// This will eventually propagate to our contents via ProcessAtomTemperature()
/atom/proc/handle_external_heating(var/adjust_temp, var/obj/item/heated_by, var/mob/user)

	if(!ATOM_SHOULD_TEMPERATURE_ENQUEUE(src))
		return FALSE

	var/diff_temp = (adjust_temp - temperature)
	if(diff_temp <= 0)
		return FALSE

	// Show a little message for people heating beakers with welding torches.
	if(user && heated_by)
		visible_message(SPAN_NOTICE("\The [user] carefully heats \the [src] with \the [heated_by]."))
	// Update our own heat.
	var/altered_temp = max(temperature + (ATOM_TEMPERATURE_EQUILIBRIUM_CONSTANT * temperature_coefficient * diff_temp), 0)
	ADJUST_ATOM_TEMPERATURE(src, min(adjust_temp, altered_temp))
	return TRUE

/mob/Initialize()
	. = ..()
	temperature_coefficient = isnull(temperature_coefficient) ? clamp(MAX_TEMPERATURE_COEFFICIENT - FLOOR(mob_size/4), MIN_TEMPERATURE_COEFFICIENT, MAX_TEMPERATURE_COEFFICIENT) : temperature_coefficient

// TODO: move mob bodytemperature onto this proc.
/atom/proc/ProcessAtomTemperature()
	SHOULD_NOT_SLEEP(TRUE)

	// Get our location temperature if possible.
	// Nullspace is room temperature, clearly.
	var/adjust_temp = T20C
	if(isturf(loc))
		var/turf/T = loc
		var/datum/gas_mixture/environment = T.return_air()
		if(environment)
			adjust_temp = environment.temperature
	else if(loc)
		adjust_temp = loc.temperature

	// Determine if our temperature needs to change.
	var/old_temp = temperature
	var/diff_temp = adjust_temp - temperature
	if(abs(diff_temp) >= ATOM_TEMPERATURE_EQUILIBRIUM_THRESHOLD)
		var/altered_temp = max(temperature + (ATOM_TEMPERATURE_EQUILIBRIUM_CONSTANT * temperature_coefficient * diff_temp), 0)
		ADJUST_ATOM_TEMPERATURE(src, (diff_temp > 0) ? min(adjust_temp, altered_temp) : max(adjust_temp, altered_temp))
	else
		temperature = adjust_temp
		. = PROCESS_KILL

	// If our temperature changed, our contents probably want to know about it.
	if(temperature != old_temp)
		queue_temperature_atoms(get_contained_temperature_sensitive_atoms())
