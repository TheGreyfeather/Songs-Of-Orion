/decl/hierarchy/outfit/job/medical
	hierarchy_type = /decl/hierarchy/outfit/job/medical
	shoes = /obj/item/clothing/shoes/color/black
	id_type = /obj/item/card/id/med
	pda_type = /obj/item/modular_computer/pda/moebius/medical
	pda_slot = slot_l_store


/decl/hierarchy/outfit/job/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/medical/cmo
	name = OUTFIT_JOB_NAME("Brotherhood coordinator")
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/rank/coordinator
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/old
	l_hand = /obj/item/storage/firstaid/adv
	r_pocket = /obj/item/device/lighting/toggleable/flashlight/pen
	id_type = /obj/item/card/id/cmo
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	belt = /obj/item/storage/belt/medical
	backpack_contents = list(/obj/item/gun/projectile/selfload/moebius = 1, /obj/item/ammo_magazine/pistol/rubber = 2, /obj/item/spacecash/bundle/vagabond =1)

/decl/hierarchy/outfit/job/medical/doctor
	name = OUTFIT_JOB_NAME("Brotherhood Doctor")
	uniform = /obj/item/clothing/under/rank/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/old
	l_hand = /obj/item/storage/firstaid
	r_pocket = /obj/item/device/lighting/toggleable/flashlight/pen
	belt = /obj/item/storage/belt/medical
	r_pocket = /obj/item/device/radio/alt2

/decl/hierarchy/outfit/job/medical/volunteer
	name = OUTFIT_JOB_NAME("Brotherhood Volunteer")
	uniform = /obj/item/clothing/under/rank/volunteer
	r_ear  = /obj/item/pen/pencil
	belt = /obj/item/device/radio
	l_pocket = /obj/item/spacecash/bundle/vagabond

/decl/hierarchy/outfit/job/medical/chemist
	name = OUTFIT_JOB_NAME("Moebius Chemist")
	uniform = /obj/item/clothing/under/rank/chemist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/chemist
	id_type = /obj/item/card/id/chem
	pda_type = /obj/item/modular_computer/pda/moebius/chemistry
	belt = /obj/item/storage/belt/medical/


/decl/hierarchy/outfit/job/medical/chemist/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/storage/backpack/orange/chemist;
	backpack_overrides[/decl/backpack_outfit/backsport]     = /obj/item/storage/backpack/sport/orange;
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/orange/chemist;

/decl/hierarchy/outfit/job/medical/paramedic
	name = OUTFIT_JOB_NAME("Moebius Paramedic")
	head = /obj/item/clothing/head/armor/faceshield/paramedic
	uniform = /obj/item/clothing/under/rank/paramedic
	suit = /obj/item/clothing/suit/armor/paramedic
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/storage/firstaid/adv
	belt = /obj/item/storage/belt/medical/emt
	backpack_contents = list(/obj/item/gun/projectile/selfload/moebius = 1, /obj/item/ammo_magazine/pistol/rubber = 1, /obj/item/modular_computer/tablet/moebius/preset = 1)
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/medical/bioengineer
	name = OUTFIT_JOB_NAME("Moebius Bio-Engineer")
	uniform = /obj/item/clothing/under/rank/bioengineer
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/bioengineer
	l_hand = /obj/item/storage/freezer/medical
	r_pocket = /obj/item/device/lighting/toggleable/flashlight/pen
	belt = /obj/item/storage/belt/medical/
