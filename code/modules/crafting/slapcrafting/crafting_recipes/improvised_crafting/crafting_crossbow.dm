/obj/item/crossbowframe
	name = "crossbow frame"
	desc = "A half-finished crossbow."
	icon_state = "crossbowframe0"
	item_state = "crossbow-solid"
	icon = 'icons/obj/crafting_icons.dmi'
	material = /decl/material/solid/metal/steel

/decl/crafting_stage/material/crossbow_rods
	descriptor = "crossbow"
	begins_with_object_type = /obj/item/crossbowframe
	completion_trigger_type = /obj/item/stack/material/rods
	stack_consume_amount = 3
	item_icon_state = "crossbowframe1"
	progress_message = "You assemble a backbone of rods around the wooden stock."
	next_stages = list(/decl/crafting_stage/welding/crossbow_rods)
	available_to_map_tech_level = MAP_TECH_LEVEL_SPACE

/decl/crafting_stage/welding/crossbow_rods
	completion_trigger_type = /obj/item/weldingtool
	item_icon_state = "crossbowframe2"
	progress_message = "You weld the rods into place."
	next_stages = list(/decl/crafting_stage/wiring/crossbow_battery)
	item_desc = "It is a half-built crossbow with a loose rod frame in place."

/decl/crafting_stage/wiring/crossbow_battery
	item_icon_state = "crossbowframe3"
	progress_message = "You wire a crude cell mount into the top of the crossbow."
	next_stages = list(/decl/crafting_stage/material/crossbow_plastic)
	item_desc = "It is a half-built crossbow with a steel backbone welded in place."

/decl/crafting_stage/material/crossbow_plastic
	completion_trigger_type = /obj/item/stack/material/panel
	stack_consume_amount  = 3
	item_icon_state = "crossbowframe4"
	item_desc = "It is a half-built crossbow with a steel backbone and a cell mount installed."
	progress_message = "You assemble and install a heavy plastic lath onto the crossbow."
	next_stages = list(/decl/crafting_stage/wiring/crossbow_string)
	stack_material = /decl/material/solid/organic/plastic

/decl/crafting_stage/wiring/crossbow_string
	item_icon_state = "crossbowframe5"
	item_desc = "It is a half-built crossbow with a steel backbone, plastic lath and a cell mount installed."
	progress_message = "You string a steel cable across the crossbow's lath."
	next_stages = list(/decl/crafting_stage/screwdriver/crossbow)

/decl/crafting_stage/screwdriver/crossbow
	progress_message = "You secure the crossbow's various parts."
	product = /obj/item/gun/launcher/bow/crossbow/powered
