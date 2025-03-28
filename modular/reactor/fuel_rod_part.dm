/obj/machinery/multistructure/nuclear_reactor_part/fuel_rod
	name = "fuel rod section"
	desc = "A section designed to hold and use fuel rods to enable nuclear reactions."
	//icon_state = "fuel_spot"
	var/current_step = STEP_NO_ROD
	var/obj/item/fuel_rod/fuel

/obj/machinery/multistructure/nuclear_reactor_part/fuel_rod/Initialize(mapload, ...)
	..()
	if(mapload)
		fuel = new /obj/item/fuel_rod/uranium()
		current_step = STEP_INTACT
	update_icon()

/obj/machinery/multistructure/nuclear_reactor_part/fuel_rod/attackby(obj/item/I, mob/user)
	switch(current_step)
		if(STEP_INTACT)
			if(I.get_tool_type(user, list(QUALITY_BOLT_TURNING), src) == QUALITY_BOLT_TURNING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_BOLT_TURNING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(SPAN_NOTICE("[user] loosen the bolts."), SPAN_NOTICE("You loosen the bolts."))
					current_step = STEP_UNWRENCHED
					return

		if(STEP_UNWRENCHED)
			if(I.get_tool_type(user, list(QUALITY_BOLT_TURNING), src) == QUALITY_BOLT_TURNING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_BOLT_TURNING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(SPAN_NOTICE("[user] tighten the bolts."), SPAN_NOTICE("You tighten the bolts."))
					current_step = STEP_INTACT
					return

		if(STEP_PULLED)
			if(I.get_tool_type(user, list(QUALITY_SCREW_DRIVING), src) == QUALITY_SCREW_DRIVING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(SPAN_NOTICE("[user] unsecures the fuel rod."), SPAN_NOTICE("You unsecures the fuel rod."))
					current_step = STEP_UNSECURED
					return

		if(STEP_UNSECURED)
			var/tool_type = I.get_tool_type(user, list(QUALITY_SCREW_DRIVING, QUALITY_PRYING), src)
			if(!tool_type)
				return

			if(tool_type == QUALITY_PRYING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PRYING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(SPAN_NOTICE("[user] pries the fuel rod out."), SPAN_NOTICE("You pry the fuel rod out."))
					fuel.loc = loc
					fuel = null
					current_step = STEP_NO_ROD
					return

			if(tool_type == QUALITY_SCREW_DRIVING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(SPAN_NOTICE("[user] secures the fuel rod."), SPAN_NOTICE("You secures the fuel rod."))
					current_step = STEP_PULLED
					return

		if(STEP_NO_ROD)
			if(istype(I, /obj/item/fuel_rod) && insert_item(I, user))
				fuel = I
				current_step = STEP_UNSECURED
				return
	..()

/obj/machinery/multistructure/nuclear_reactor_part/fuel_rod/attack_hand(mob/user as mob)
	if(current_step == STEP_UNWRENCHED)
		user.visible_message(SPAN_NOTICE("[user] pulls the rod container up."), SPAN_NOTICE("You pulls the rod container up."))
		current_step = STEP_PULLED
		update_icon()
		return

	if(current_step == STEP_PULLED)
		user.visible_message(SPAN_NOTICE("[user] push the rod container down."), SPAN_NOTICE("You push the rod container down."))
		current_step = STEP_UNWRENCHED
		update_icon()
		return


/obj/machinery/multistructure/nuclear_reactor_part/fuel_rod/examine(mob/user)
	..()
	var/message

	switch(current_step)
		if(STEP_INTACT)
			message = "The bolts are tightly secured."

		if(STEP_UNWRENCHED)
			message = "The bolts are loose and the assembly is ready to be pulled up."

		if(STEP_PULLED)
			message = "The assembly is pulled up, but the fuel rod is secured by screws."

		if(STEP_UNSECURED)
			message = "The screws keeping the fuel rod in place are loose. Someone could just pry away the fuel rod!"

		if(STEP_NO_ROD)
			message = "There is no fuel rod!"

	if(message)
		to_chat(user, SPAN_NOTICE("[message]"))

// TODO for when proper sprites are done.
/obj/machinery/multistructure/nuclear_reactor_part/fuel_rod/update_icon()
	cut_overlays()
	if(current_step == STEP_PULLED)
		add_overlay("F100")
	else
		add_overlay("F0")
