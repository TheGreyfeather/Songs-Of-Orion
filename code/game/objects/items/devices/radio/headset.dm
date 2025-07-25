/obj/item/device/radio/headset
	name = "radio headset"
	desc = "An updated, modular intercom that fits over the head. Takes encryption keys"
	var/radio_desc = ""
	icon_state = "headset"
	item_state = "headset"
	matter = list(MATERIAL_PLASTIC = 1)
	subspace_transmission = 1
	canhear_range = 0 // can't hear headsets from very far away

	slot_flags = SLOT_EARS
	body_parts_covered = EARS
	var/translate_binary = 0
	var/translate_hive = 0
	var/obj/item/device/encryptionkey/keyslot1
	var/obj/item/device/encryptionkey/keyslot2

	var/ks1type = /obj/item/device/encryptionkey
	var/ks2type

/obj/item/device/radio/headset/New()
	..()
	internal_channels.Cut()
	if(ks1type)
		keyslot1 = new ks1type(src)
	if(ks2type)
		keyslot2 = new ks2type(src)
	recalculateChannels(1)

/obj/item/device/radio/headset/Destroy()
	QDEL_NULL(keyslot1)
	QDEL_NULL(keyslot2)
	return ..()

/obj/item/device/radio/headset/list_channels(var/mob/user)
	return list_secure_channels()

/obj/item/device/radio/headset/examine(mob/user, extra_description = "")
	if(get_dist(user, src) < 2 && radio_desc)
		extra_description += "The following channels are available:"
		extra_description += radio_desc
	..(user, extra_description)

/obj/item/device/radio/headset/handle_message_mode(mob/living/M as mob, message, channel)
	if (channel == "special")
		if (translate_binary)
			var/datum/language/binary = all_languages[LANGUAGE_ROBOT]
			binary.broadcast(M, message)
		if (translate_hive)
			var/datum/language/hivemind = all_languages[LANGUAGE_HIVEMIND]
			hivemind.broadcast(M, message)
		return null

	return ..()

/obj/item/device/radio/headset/receive_range(freq, level, aiOverride = 0)
	if (aiOverride)
		playsound(loc, 'sound/effects/radio_common.ogg', 25, 1, 1)
		return ..(freq, level)
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.l_ear == src || H.r_ear == src)
			playsound(loc, 'sound/effects/radio_common.ogg', 25, 1, 1)
			return ..(freq, level)
	return -1

/obj/item/device/radio/headset/taccom
	name = "TacCom headset"
	desc = "An rugged communications headset. Takes encryption keys"
	icon_state = "taccom"
	item_state = "taccom"
	matter = list(MATERIAL_PLASTIC = 1)
	subspace_transmission = 1
	canhear_range = 0 // can't hear headsets from very far away

/obj/item/device/radio/headset/syndicate
	origin_tech = list(TECH_COVERT = 3)
	syndie = TRUE
	ks1type = /obj/item/device/encryptionkey/syndicate
	spawn_blacklisted = TRUE

/obj/item/device/radio/headset/mercenaries
	origin_tech = list(TECH_COVERT = 3)
	icon_state = "taccom"
	item_state = "taccom"
	ks1type = /obj/item/device/encryptionkey/mercenaries
	spawn_blacklisted = TRUE

/obj/item/device/radio/headset/pirates
	origin_tech = list(TECH_COVERT = 2)
	ks1type = /obj/item/device/encryptionkey/pirates
	spawn_blacklisted = TRUE

/obj/item/device/radio/headset/binary
	origin_tech = list(TECH_COVERT = 3)
	ks1type = /obj/item/device/encryptionkey/binary

/obj/item/device/radio/headset/headset_sec
	name = "security TacCom headset"
	desc = "This is used by your elite security force."
	icon_state = "sec_headset"
	item_state = "sec_headset"
	ks2type = /obj/item/device/encryptionkey/headset_sec

/obj/item/device/radio/headset/headset_sar
	name = "SAR TacCom headset"
	desc = "This is used by your elite Search And Rescue Specialists."
	icon_state = "sec_headset"
	item_state = "sec_headset"
	ks2type = /obj/item/device/encryptionkey/headset_sar

/obj/item/device/radio/headset/headset_sec/alt
	name = "security radio headset"
	desc = "This is used by your elite security force."
	icon_state = "headset"
	item_state = "headset"

/obj/item/device/radio/headset/headset_sar/alt
	name = "SAR radio headset"
	desc = "This is used by your elite Search And Rescue Specialists."
	icon_state = "headset"
	item_state = "headset"

/obj/item/device/radio/headset/headset_eng
	name = "engineering radio headset"
	desc = "When the engineers wish to chat like girls."
	icon_state = "eng_headset"
	item_state = "eng_headset"
	ks2type = /obj/item/device/encryptionkey/headset_eng

/obj/item/device/radio/headset/headset_eng/erp
	name = "ERP radio headset"
	desc = "When the divers wish to chat like girls."
	icon_state = "taccom"
	item_state = "taccom"
	ks2type = /obj/item/device/encryptionkey/headset_eng

/obj/item/device/radio/headset/headset_rob
	name = "robotics radio headset"
	desc = "Made specifically for the roboticists who cannot decide between departments."
	icon_state = "rob_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/headset_moebius

/obj/item/device/radio/headset/headset_med
	name = "medical radio headset"
	desc = "A headset for the trained staff of the medbay."
	icon_state = "med_headset"
	item_state = "med_headset"
	ks2type = /obj/item/device/encryptionkey/headset_moebius

/obj/item/device/radio/headset/headset_sci
	name = "science radio headset"
	desc = "A sciency headset. Like usual."
	icon_state = "com_headset"
	item_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/headset_moebius

/obj/item/device/radio/headset/headset_com
	name = "command radio headset"
	desc = "A headset with a commanding channel."
	icon_state = "com_headset"
	item_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/headset_com

/obj/item/device/radio/headset/heads
	bad_type = /obj/item/device/radio/headset/heads
	spawn_blacklisted = TRUE

/obj/item/device/radio/headset/heads/captain
	name = "captain's headset"
	desc = "The headset of the boss."
	icon_state = "com_headset"
	item_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/captain

/obj/item/device/radio/headset/heads/ai_integrated //No need to care about icons, it should be hidden inside the AI anyway.
	name = "\improper AI subspace transceiver"
	desc = "Integrated AI radio transceiver."
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "radio"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/heads/ai_integrated
	var/myAi    // Atlantis: Reference back to the AI which has this radio.
	var/disabledAi = 0 // Atlantis: Used to manually disable AI's integrated radio via intellicard menu.

/obj/item/device/radio/headset/heads/ai_integrated/receive_range(freq, level)
	if (disabledAi)
		return -1 //Transciever Disabled.
	return ..(freq, level, 1)

/obj/item/device/radio/headset/heads/rd
	name = "HRO's headset"
	desc = "The headset of the Human Resources Officer."
	icon_state = "com_headset"
	item_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/moebius

/obj/item/device/radio/headset/heads/hos
	name = "HoS' headset"
	desc = "The headset of the man who protects your worthless lifes."
	icon_state = "com_headset"
	item_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/hos

/obj/item/device/radio/headset/heads/ce
	name = "CE's headset"
	desc = "The headset of the one in charge of morons"
	icon_state = "com_headset"
	item_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/ce

/obj/item/device/radio/headset/heads/ce/foreman
	name = "Foreman headset"
	desc = "The headset of the one in charge of shaved apes."

/obj/item/device/radio/headset/heads/ce/foreman/taccom
	name = "Foreman headset"
	desc = "The headset of the one in charge of shaved apes."
	icon_state = "taccom"
	item_state = "taccom"

/obj/item/device/radio/headset/heads/cmo
	name = "Coordinator's headset"
	desc = "The headset of the Brotherhood's Coordinator."
	icon_state = "com_headset"
	item_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/moebius

/obj/item/device/radio/headset/heads/hop
	name = "first officer's headset"
	desc = "The headset of the guy who will one day be captain."
	icon_state = "com_headset"
	item_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/hop

/obj/item/device/radio/headset/heads/merchant
	name = "Syndicate Officer's headset"
	desc = "The headset of the guy who know price for everything."
	icon_state = "com_headset"
	item_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/merchant

/obj/item/device/radio/headset/heads/preacher
	name = "neotheology preacher's headset"
	desc = "The headset of the man who leads you to god."
	icon_state = "nt_com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/heads/preacher

/obj/item/device/radio/headset/headset_cargo
	name = "Syndicate radio headset"
	desc = "A headset used by Syndicate slaves."
	icon_state = "cargo_headset"
	item_state = "taccom_dark"
	ks2type = /obj/item/device/encryptionkey/headset_cargo

/obj/item/device/radio/headset/headset_service
	name = "service radio headset"
	desc = "Headset used by the service staff, tasked with keeping the ship full, happy and clean."
	icon_state = "srv_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/headset_service

/obj/item/device/radio/headset/ia
	name = "internal affair's headset"
	desc = "The headset of your worst enemy."
	icon_state = "com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/heads/hos

/obj/item/device/radio/headset/church
	name = "neotheology headset"
	desc = "If you listen closely you can hear God."
	icon_state = "nt_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/headset_church

/obj/item/device/radio/headset/military
	name = "SOLCOM TacCom headset"
	desc = "This is used by SOLCOM military personnel."
	icon_state = "sec_headset"
	item_state = "sec_headset"
	ks2type = /obj/item/device/encryptionkey/military

/obj/item/device/radio/headset/military/commander
	name = "SOLCOM officer radio headset"
	desc = "This is used by SOLCOM military officers, someone you really shouldn't be reading the headset of."
	icon_state = "headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/heads/military

/obj/item/device/radio/headset/attackby(obj/item/I, mob/user)
	if(QUALITY_SCREW_DRIVING in I.tool_qualities)
		if(keyslot1 || keyslot2)
			for(var/ch_name in channels)
				SSradio.remove_object(src, radiochannels[ch_name])
				secure_radio_connections[ch_name] = null

			var/turf/T = get_turf(user)
			if(T)
				if(keyslot1)
					keyslot1.loc = T
					keyslot1 = null

				if(keyslot2)
					keyslot2.loc = T
					keyslot2 = null

			recalculateChannels()
			to_chat(user, "You pop out the encryption keys in the headset!")

		else
			to_chat(user, "This headset doesn't have any encryption keys!  How useless...")

	if(istype(I, /obj/item/device/encryptionkey))
		if(keyslot1 && keyslot2)
			to_chat(user, "The headset can't hold another key!")
			return

		if(!keyslot1)
			user.drop_item()
			I.loc = src
			keyslot1 = I

		else
			user.drop_item()
			I.loc = src
			keyslot2 = I

		recalculateChannels()


/obj/item/device/radio/headset/proc/recalculateChannels(var/setDescription = 0)
	src.channels = list()
	src.translate_binary = FALSE
	src.translate_hive = FALSE
	src.syndie = FALSE
	src.merc = FALSE
	src.pirate = FALSE

	if(keyslot1)
		for(var/ch_name in keyslot1.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot1.channels[ch_name]

		if(keyslot1.translate_binary)
			src.translate_binary = TRUE

		if(keyslot1.translate_hive)
			src.translate_hive = TRUE

		if(keyslot1.syndie)
			src.syndie = TRUE

		if(keyslot1.merc)
			src.merc = TRUE

		if(keyslot1.pirate)
			src.pirate = TRUE

	if(keyslot2)
		for(var/ch_name in keyslot2.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot2.channels[ch_name]

		if(keyslot2.translate_binary)
			src.translate_binary = TRUE

		if(keyslot2.translate_hive)
			src.translate_hive = TRUE

		if(keyslot2.syndie)
			src.syndie = TRUE

		if(keyslot2.merc)
			src.merc = TRUE

		if(keyslot2.pirate)
			src.pirate = TRUE


	for (var/ch_name in channels)
		secure_radio_connections[ch_name] = SSradio.add_object(src, radiochannels[ch_name],  RADIO_CHAT)

	if(setDescription)
		setupRadioDescription()

	return

/obj/item/device/radio/headset/proc/setupRadioDescription()
	var/radio_text = ""
	for(var/i = 1 to channels.len)
		var/channel = channels[i]
		var/key = get_radio_key_from_channel(channel)
		radio_text += "[key] - [channel]"
		if(i != channels.len)
			radio_text += ", "

	radio_desc = radio_text

