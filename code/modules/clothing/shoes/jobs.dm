/obj/item/clothing/shoes/galoshes
	desc = "Rubber boots with high traction. Prevents the wearer from slipping."
	name = "galoshes"
	icon_state = "galoshes"
	permeability_coefficient = 0.05
	siemens_coefficient = 0 // DAMN BOI
	item_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN + 1
	species_restricted = null
	style = STYLE_NEG_HIGH

/obj/item/clothing/shoes/jackboots
	name = "jackboots"
	desc = "If you want a picture of the future, imagine a boot stomping on a human face- forever."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = WEAPON_FORCE_WEAK
	armor = list(
		melee = 3,
		bullet = 0,
		energy = 2,
		bomb = 0,
		bio = 25,
		rad = 0
	)
	siemens_coefficient = 0.6
	can_hold_knife = TRUE

/obj/item/clothing/shoes/jackboots/ironhammer
	icon_state = "jackboots_ironhammer"
	desc = "Standard-issue Ironhammer combat boots for combat scenarios or combat situations. All combat, all the time."

/obj/item/clothing/shoes/jackboots/german
	name = "Oberth Republic boots"
	desc = "A pair of brown boots."
	icon_state = "jackboots_german"

/obj/item/clothing/shoes/jackboots/neotheology
	name = "custodian's jackboots"
	desc = "Specially altered jackboots for NeoTheology custodians to prevent them from slipping."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = WEAPON_FORCE_HARMLESS
	siemens_coefficient = 0.3
	item_flags = NOSLIP
	can_hold_knife = TRUE
	spawn_blacklisted = TRUE

/obj/item/clothing/shoes/reinforced
	name = "reinforced shoes"
	desc = "Slightly reinforced shoes. Optimal for your journey into a wonderful world of maintenance."
	icon_state = "reinforced"
	item_state = "reinforced"
	armor = list(
		melee = 3,
		bullet = 0,
		energy = 2,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.5

/obj/item/clothing/shoes/reinforced/ironhammer
	icon_state = "reinforced_ironhammer"

/obj/item/clothing/shoes/reinforced/medical
	name = "moebius reinforced shoes"
	desc = "Slightly reinforced shoes for moebius medical personnel."
	icon_state = "reinforced_moebius"
	item_state = "reinforced_moebius"
	spawn_blacklisted = TRUE

/obj/item/clothing/shoes/workboots
	name = "work boots"
	desc = "A pair of steel-toed work boots designed for use in industrial settings. Safety first."
	icon_state = "workboots"
	item_state = "workboots"
	siemens_coefficient = 0
	armor = list(
		melee = 2,
		bullet = 0,
		energy = 2,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	can_hold_knife = TRUE
	style = STYLE_NEG_HIGH

/obj/item/clothing/shoes/workboots/proletariat
	name = "Excelsior boots"
	desc = "Robust, yet surprisingly posh boots; one and only design worn by comrades everywhere from Haven to null sector."
	icon_state = "prolo_boots"
	item_state = "prolo_boots"
	siemens_coefficient = 0
	armor = list(
		melee = 3,
		bullet = 2,
		energy = 2,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	can_hold_knife = TRUE
	style = STYLE_HIGH

/obj/item/clothing/shoes/korund
	name = "Excelsior assault boots"
	desc = "Heavily reinforced ankle boots for combat scenarios."
	icon_state = "korund_boots"
	item_state = "korund_boots"
	siemens_coefficient = 0
	armor = list(
		melee = 5,
		bullet = 7,
		energy = 5,
		bomb = 35,
		bio = 0,
		rad = 0
	)
	can_hold_knife = TRUE
	style = STYLE_NEG_HIGH
	spawn_blacklisted = TRUE

/obj/item/clothing/shoes/artist_shoes
	name = "Pointy Shoes"
	desc = "They're actually quite comfortable."
	icon_state = "artist"
	item_state = "artist_shoes"
	spawn_frequency = 0
