/*
	Datum-based species. Should make for much cleaner and easier to maintain race code.
*/
#define SPECIES_BLOOD_DEFAULT 560
/datum/species

	// Descriptors and strings.
	var/name                                             // Species name.
	var/name_plural                                      // Pluralized name (since "[name]s" is not always valid)
	var/blurb = "A completely nondescript species."      // A brief lore summary for use in the chargen screen.

	// Icon/appearance vars.
	var/icobase = 'icons/mob/human_races/solar/r_human.dmi'    // Normal icon set.
	var/deform = 'icons/mob/human_races/r_def_human.dmi' 		// Mutated icon set.
	var/faceicobase = 'icons/mob/human_face.dmi'

	// Damage overlay and masks.
	var/damage_overlays = 'icons/mob/human_races/solar/dam_human.dmi'
	var/damage_mask = 'icons/mob/human_races/solar/dam_mask_human.dmi'
	var/blood_mask = 'icons/mob/human_races/solar/blood_human.dmi'

	var/prone_icon                                       // If set, draws this from icobase when mob is prone.
	var/eyes = "eyes_s"                                  // Icon for eyes.
	var/has_floating_eyes                                // Eyes will overlay over darkness (glow)
	var/blood_color = "#A10808"                          // Red.
	var/flesh_color = "#FFC896"                          // Pink.
	var/base_color                                       // Used by carrions. Should also be used for icon previes..
	var/tail                                             // Name of tail state in species effects icon file.
	var/tail_animation                                   // If set, the icon to obtain tail animation states from.
	var/race_key = 0       	                             // Used for mob icon cache string.
	var/icon/icon_template                               // Used for mob icon generation for non-32x32 species.
	var/mob_size	= MOB_MEDIUM
	var/show_ssd = "fast asleep"
	var/virus_immune
	var/blood_volume = 560                               // Initial blood volume.
	var/hunger_factor = DEFAULT_HUNGER_FACTOR            // Multiplier for hunger.
	var/taste_sensitivity = TASTE_NORMAL                 // How sensitive the species is to minute tastes.

	var/min_age = 17
	var/max_age = 70

	// Language vars.
	var/default_language = LANGUAGE_COMMON   // Default language is used when 'say' is used without modifiers.
	var/language = LANGUAGE_COMMON           // Default racial language, if any.
	var/list/secondary_langs = list()        // The names of secondary languages that are available to this species.
	var/list/speech_sounds                   // A list of sounds to potentially play when speaking.
	var/list/speech_chance                   // The likelihood of a speech sound playing.
	var/num_alternate_languages = 0          // How many secondary languages are available to select at character creation
	var/name_language = LANGUAGE_COMMON      // The language to use when determining names for this species, or null to use the first name/last name generator

	// Combat vars.
	var/total_health = 100                   // Point at which the mob will enter crit.
	var/list/unarmed_types = list(           // Possible unarmed attacks that the mob will use in combat,
		/datum/unarmed_attack,
		/datum/unarmed_attack/bite
		)
	var/list/unarmed_attacks = null          // For empty hand harm-intent attack
	var/brute_mod =     1                    // Physical damage multiplier.
	var/burn_mod =      1                    // Burn damage multiplier.
	var/oxy_mod =       1                    // Oxyloss modifier
	var/toxins_mod =    1                    // Toxloss modifier
	var/radiation_mod = 1                    // Radiation modifier
	var/flash_mod =     1                    // Stun from blindness modifier.
	var/vision_flags = SEE_SELF              // Same flags as glasses.
	var/injury_type =  INJURY_TYPE_LIVING    // From _DEFINES/weapons.dm

	var/list/hair_styles
	var/list/facial_hair_styles

	// Death vars.
	var/meat_type = /obj/item/reagent_containers/food/snacks/meat/human
	var/gibber_type = /obj/effect/gibspawner/human
	var/single_gib_type = /obj/effect/decal/cleanable/blood/gibs
	var/remains_type = /obj/item/remains/xeno
	var/gibbed_anim = "gibbed-h"
	var/dusted_anim = "dust-h"
	var/death_sound
	var/death_message = "seizes up and falls limp, their eyes dead and lifeless..."
	var/knockout_message = "has been knocked unconscious!"

	// Environment tolerance/life processes vars.
	var/reagent_tag                                   //Used for metabolizing reagents.
	var/breath_pressure = 16                          // Minimum partial pressure safe for breathing, kPa
	var/breath_type = "oxygen"                        // Non-oxygen gas breathed, if any.
	var/poison_type = "plasma"                        // Poisonous air.
	var/exhale_type = "carbon_dioxide"                // Exhaled gas type.
	var/cold_level_1 = 260                            // Cold damage level 1 below this point.
	var/cold_level_2 = 200                            // Cold damage level 2 below this point.
	var/cold_level_3 = 120                            // Cold damage level 3 below this point.
	var/heat_level_1 = 360                            // Heat damage level 1 above this point.
	var/heat_level_2 = 400                            // Heat damage level 2 above this point.
	var/heat_level_3 = 1000                           // Heat damage level 3 above this point.
	var/passive_temp_gain = 0		                  // Species will gain this much temperature every second
	var/hazard_high_pressure = HAZARD_HIGH_PRESSURE   // Dangerously high pressure.
	var/warning_high_pressure = WARNING_HIGH_PRESSURE // High pressure warning.
	var/warning_low_pressure = WARNING_LOW_PRESSURE   // Low pressure warning.
	var/hazard_low_pressure = HAZARD_LOW_PRESSURE     // Dangerously low pressure.
	var/light_dam                                     // If set, mob will be damaged in light over this value and heal in light below its negative.
	var/body_temperature = 310.15	                  // Non-IS_SYNTHETIC species will try to stabilize at this temperature.
	                                                  // (also affects temperature processing)

	var/heat_discomfort_level = 315                   // Aesthetic messages about feeling warm.
	var/cold_discomfort_level = 285                   // Aesthetic messages about feeling chilly.
	var/list/heat_discomfort_strings = list(
		"You feel sweat drip down your neck.",
		"You feel uncomfortably warm.",
		"Your skin prickles in the heat."
		)
	var/list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)

	// HUD data vars.
	var/datum/hud_data/hud
	var/hud_type

	// Body/form vars.
	var/list/inherent_verbs 	  // Species-specific verbs.
	var/has_fine_manipulation = 1 // Can use small items.
	var/siemens_coefficient = 1   // The lower, the thicker the skin and better the insulation.
	var/darksight = 2             // Native darksight distance.
	var/flags = 0                 // Various specific features.
	var/appearance_flags = 0      // Appearance/display related features.
	var/spawn_flags = 0           // Flags that specify who can spawn as this species
	var/slowdown = 0              // Passive movement speed malus (or boost, if negative)
	var/lower_sanity_process	  // Controls how much sanity is processed on the mob for performance reasons.
	var/holder_type
	var/gluttonous                // Can eat some mobs. Values can be GLUT_TINY, GLUT_SMALLER, GLUT_ANYTHING.
	var/species_rarity_value = 1          // Relative rarity/collector value for this species.
	                              // Determines the organs that the species spawns with and
	var/list/has_process = list(    // which required-process checks are conducted and defalut organs for them.
		OP_HEART =    /obj/item/organ/internal/vital/heart,
		OP_LUNGS =    /obj/item/organ/internal/vital/lungs,
		OP_STOMACH =  /obj/item/organ/internal/stomach,
		OP_LIVER =    /obj/item/organ/internal/liver,
		OP_KIDNEY_LEFT =  /obj/item/organ/internal/kidney/left,
		OP_KIDNEY_RIGHT = /obj/item/organ/internal/kidney/right,
		BP_BRAIN =    /obj/item/organ/internal/vital/brain,
		OP_APPENDIX = /obj/item/organ/internal/appendix,
		OP_EYES =     /obj/item/organ/internal/eyes
		)
	var/vision_organ              // If set, this organ is required for vision. Defaults to "eyes" if the species has them.

	// The order is important!
	var/list/has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest,
		BP_GROIN =  new /datum/organ_description/groin,
		BP_HEAD =   new /datum/organ_description/head,
		BP_L_ARM =  new /datum/organ_description/arm/left,
		BP_R_ARM =  new /datum/organ_description/arm/right,
		BP_L_LEG =  new /datum/organ_description/leg/left,
		BP_R_LEG =  new /datum/organ_description/leg/right
		)

	// Misc
	var/list/genders = list(MALE, FEMALE)

	// Bump vars
	var/bump_flag = HUMAN	// What are we considered to be when bumped?
	var/push_flags = ~HEAVY	// What can we push?
	var/swap_flags = ~HEAVY	// What can we swap place with?

	var/pass_flags = 0

	var/list/perks = list()

/datum/species/proc/get_eyes(mob/living/carbon/human/H)
	return

/datum/species/New()
	if(hud_type)
		hud = new hud_type()
	else
		hud = new()

	//If the species has eyes, they are the default vision organ
	if(!vision_organ && has_process[OP_EYES])
		vision_organ = BP_EYES

	unarmed_attacks = list()
	for(var/u_type in unarmed_types)
		unarmed_attacks += new u_type()

/datum/species/proc/get_station_variant()
	return name

/datum/species/proc/get_bodytype()
	return name


/datum/species/proc/get_environment_discomfort(mob/living/carbon/human/H, msg_type)

	if(!prob(5))
		return

	var/covered = 0 // Basic coverage can help.
	for(var/obj/item/clothing/clothes in H)
		if(H.l_hand == clothes|| H.r_hand == clothes)
			continue
		if((clothes.body_parts_covered & UPPER_TORSO) && (clothes.body_parts_covered & LOWER_TORSO))
			covered = 1
			break

	switch(msg_type)
		if("cold")
			if(!covered)
				to_chat(H, SPAN_DANGER("[pick(cold_discomfort_strings)]"))
		if("heat")
			if(covered)
				to_chat(H, SPAN_DANGER("[pick(heat_discomfort_strings)]"))

/datum/species/proc/sanitize_name(name)
	return sanitizeName(name)

/datum/species/proc/get_random_name(gender)
	if(!name_language)
		if(gender == FEMALE)
			return capitalize(pick(GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
		else
			return capitalize(pick(GLOB.first_names_male)) + " " + capitalize(pick(GLOB.last_names))

	var/datum/language/species_language = all_languages[name_language]
	if(!species_language)
		species_language = all_languages[default_language]
	if(!species_language)
		return "unknown"
	return species_language.get_random_name(gender)

/datum/species/proc/get_random_first_name(gender)
	if(!name_language)
		if(gender == FEMALE)
			return capitalize(pick(GLOB.first_names_female))
		else
			return capitalize(pick(GLOB.first_names_male))

	var/datum/language/species_language = all_languages[name_language]
	if(!species_language)
		species_language = all_languages[default_language]
	if(!species_language)
		return "unknown"
	return species_language.get_random_name(gender)

/datum/species/proc/get_random_last_name()
	if(!name_language)
		return capitalize(pick(GLOB.last_names))

	var/datum/language/species_language = all_languages[name_language]
	if(!species_language)
		species_language = all_languages[default_language]
	if(!species_language)
		return "unknown"
	return species_language.get_random_name()


/datum/species/proc/organs_spawned(mob/living/carbon/human/H)
	return

/datum/species/proc/hug(mob/living/carbon/human/H, mob/living/target)

	var/t_him = "them"
	switch(target.gender)
		if(MALE)
			t_him = "him"
		if(FEMALE)
			t_him = "her"

	H.visible_message(SPAN_NOTICE("[H] hugs [target] to make [t_him] feel better!"), \
					SPAN_NOTICE("You hug [target] to make [t_him] feel better!"))

/datum/species/proc/remove_inherent_verbs(mob/living/carbon/human/H)
	if(inherent_verbs)
		for(var/verb_path in inherent_verbs)
			remove_verb(H, verb_path)

/datum/species/proc/add_inherent_verbs(mob/living/carbon/human/H)
	if(inherent_verbs)
		for(var/verb_path in inherent_verbs)
			add_verb(H, verb_path)

/datum/species/proc/handle_post_spawn(mob/living/carbon/human/H) //Handles anything not already covered by basic species assignment.
	add_inherent_verbs(H)
	H.mob_bump_flag = bump_flag
	H.mob_swap_flags = swap_flags
	H.mob_push_flags = push_flags
	H.pass_flags = pass_flags
	H.mob_size = mob_size

/datum/species/proc/handle_death(mob/living/carbon/human/H) //Handles any species-specific death events (such as dionaea nymph spawns).
	return

// Only used for alien plasma weeds atm, but could be used for Dionaea later.
/datum/species/proc/handle_environment_special(mob/living/carbon/human/H)
	return

// Used to update alien icons for aliens.
/datum/species/proc/handle_login_special(mob/living/carbon/human/H)
	return

// As above.
/datum/species/proc/handle_logout_special(mob/living/carbon/human/H)
	return

// Builds the HUD using species-specific icons and usable slots.
/datum/species/proc/build_hud(mob/living/carbon/human/H)
	return

//Used by xenos understanding larvae and dionaea understanding nymphs.
/datum/species/proc/can_understand(mob/other)
	return

// Called when using the shredding behavior.
/datum/species/proc/can_shred(mob/living/carbon/human/H, ignore_intent)

	if(!ignore_intent && H.a_intent != I_HURT)
		return 0

	for(var/datum/unarmed_attack/attack in unarmed_attacks)
		if(!attack.is_usable(H))
			continue
		if(attack.shredding)
			return 1

	return 0

// Called in life() when the mob has no client.
/datum/species/proc/handle_npc(mob/living/carbon/human/H)
	return

/datum/species/proc/get_vision_flags(mob/living/carbon/human/H)
	return vision_flags

/datum/species/proc/handle_vision(mob/living/carbon/human/H)
	if(!H.client || H.stat == DEAD) // No client - no screen to update
		return

	H.update_sight()
	H.sight |= get_vision_flags(H)
	H.sight |= H.equipment_vision_flags

	if(!H.druggy)
		H.see_in_dark = (H.sight == SEE_TURFS|SEE_MOBS|SEE_OBJS) ? 8 : min(darksight + H.equipment_darkness_modifier, 8)

	if(H.equipment_see_invis)
		H.see_invisible = H.equipment_see_invis

	if(H.equipment_tint_total >= TINT_BLIND)
		H.eye_blind = max(H.eye_blind, 1)

	if(config.welder_vision)
		if(H.equipment_tint_total == TINT_HEAVY)
			H.client.screen |= global_hud.darkMask
		else if((!H.equipment_prescription && (H.sdisabilities & NEARSIGHTED)) || H.equipment_tint_total == TINT_MODERATE)
			H.client.screen |= global_hud.vimpaired
		else if(H.equipment_tint_total == TINT_LOW)
			H.client.screen |= global_hud.lightMask

	for(var/overlay in H.equipment_overlays)
		H.client.screen |= overlay


/datum/species/proc/get_facial_hair_styles(gender)
	var/list/facial_hair_styles_by_species = LAZYACCESS(facial_hair_styles, type)
	if(!facial_hair_styles_by_species)
		facial_hair_styles_by_species = list()
		LAZYSET(facial_hair_styles, type, facial_hair_styles_by_species)

	var/list/facial_hair_style_by_gender = facial_hair_styles_by_species[gender]
	if(!facial_hair_style_by_gender)
		facial_hair_style_by_gender = list()
		LAZYSET(facial_hair_styles_by_species, gender, facial_hair_style_by_gender)

		for(var/facialhairstyle in GLOB.facial_hair_styles_list)
			var/datum/sprite_accessory/S = GLOB.facial_hair_styles_list[facialhairstyle]
			if(gender == MALE && S.gender == FEMALE)
				continue
			if(gender == FEMALE && S.gender == MALE)
				continue
			if(!(get_bodytype() in S.species_allowed))
				continue
			ADD_SORTED(facial_hair_style_by_gender, facialhairstyle, /proc/cmp_text_asc)
			facial_hair_style_by_gender[facialhairstyle] = S

	return facial_hair_style_by_gender

/datum/species/proc/get_hair_styles()
	var/list/L = LAZYACCESS(hair_styles, type)
	if(!L)
		L = list()
		LAZYSET(hair_styles, type, L)
		for(var/hairstyle in GLOB.hair_styles_list)
			var/datum/sprite_accessory/S = GLOB.hair_styles_list[hairstyle]
			if(!(get_bodytype() in S.species_allowed))
				continue
			ADD_SORTED(L, hairstyle, /proc/cmp_text_asc)
			L[hairstyle] = S
	return L

/datum/species/proc/equip_survival_gear(mob/living/carbon/human/H, extendedtank = TRUE)
	var/box_type = /obj/item/storage/box/survival

	if(extendedtank)
		box_type = /obj/item/storage/box/survival/extended

	if(istype(H.get_equipped_item(slot_back), /obj/item/storage))
		H.equip_to_storage(new box_type(H.back))
	else
		H.equip_to_slot_or_del(new box_type(H), slot_r_hand)

/datum/species/proc/has_equip_slot(slot)
	if(hud && hud.equip_slots)
		if(!(slot in hud.equip_slots))
			return FALSE
	return TRUE
