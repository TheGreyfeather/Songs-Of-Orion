// Aetherium Spire, an indestructible building that constantly refill missing aetherium around it.
// Event-only baring a few exception. False Spires aren't as dangerous.
/obj/structure/aetherium_crystal/spire
	name = "true aetherium spire"
	desc = "A strange crystal formation that seems to grow on its own..."
	icon_state = "aetherium_crystal_purple"
	anchored = TRUE
	density = TRUE
	light_range = 7 // Glow in the dark
	light_power = 7
	light_color = COLOR_LIGHTING_PURPLE_BRIGHT
	growth = 50 // Bigger than other crystals
	growth_prob = 5 // Spread crystals faster
	mining_time = WORKTIME_EXTREMELY_LONG // Spires take a long time to mine
	golem_timer = 100
	spread_range = 5
	rad_damage = 3
	rad_range = 7
	blue_crystal_prob = 10 // More chances of spawning a blue crystal
	shooter = TRUE // They can shoot at you
	recharge_delay = 75 SECONDS
	max_projectiles = 30 // True Spires are more dangerous
	var/respawn_distance = 10 // How many tiles do we let the golem get before spawning another
	var/attune_time = 60 SECONDS // How much time does it take to attune with the spire. Must be less than the recharge_delay

/obj/structure/aetherium_crystal/spire/update_icon()
	transform = initial(transform)
	transform *= 1.5 // 50% bigger

/obj/structure/aetherium_crystal/spire/attackby(obj/item/I, mob/user)
	if(!is_fake) // Cannot destroy True Spires
		src.visible_message(SPAN_NOTICE("[user] cannot make a dent into [src]."), SPAN_NOTICE("You cannot make a dent into [src]."))
		return // Can't destroy it
	else
		..()

/obj/structure/aetherium_crystal/spire/bullet_act(var/obj/item/projectile/Proj)
	return

// Spires always spawn a golem each
/obj/structure/aetherium_crystal/spire/handle_golems()
	handle_golem_distance() // So that someone doesn't grab the golem and kidnap it to render the spire harmless

	if(golem)
		return FALSE

	if(++golem_timer >= initial(golem_timer))
		golem_timer = 0
		// Psions get an early warning
		var/sound/S = sound('sound/synthesized_instruments/chromatic/vibraphone1/c5.ogg')
		/*
		for(var/mob/living/carbon/human/H in viewers(src))
			if(H.stats.getPerk(PERK_PSION))
				to_chat(H, SPAN_PSION("[src] chimes."))
				H.playsound_local(get_turf(src), S, 50) // Only psionics can hear that
		*/

		sleep((S.len + 6) SECONDS) // 10 Seconds before the beefy golem spawn

		golem = new /mob/living/carbon/superior_animal/aetherium_golem/behemoth(get_turf(src)) // Spawn a golem
		golem.node = src
		src.visible_message("[src] create a crystal golem to defend itself.")
		return TRUE

// Probably will cause a lag-spike if called.
/obj/structure/aetherium_crystal/spire/proc/mass_crystal_process_toggle()
	var/possible_answer = list("Yes", "No")
	var/choice = input(usr, "Are you sure you want to do this?", "Toggle All Processing", "No") as anything in possible_answer
	if(choice == "Yes")
		for(var/obj/structure/aetherium_crystal/AC in world) // Loop through every single crystal in the world, probably will freeze the server for a moment or two
			AC.toggle_processing()
		return TRUE
	return FALSE

/obj/structure/aetherium_crystal/spire/handle_golem_distance()
	if(golem && get_dist(get_turf(src), get_turf(golem)) > respawn_distance) // We have a golem and it is far away
		golem.node = null // Null the golem's node.
		golem = null // We can spawn another golem
		return TRUE
	else
		return FALSE
