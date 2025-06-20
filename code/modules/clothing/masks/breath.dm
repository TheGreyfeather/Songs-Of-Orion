/obj/item/clothing/mask/breath
	desc = "A close-fitting mask that can be connected to an air supply."
	name = "breath mask"
	icon_state = "pilot"
	item_state = "pilot"
	item_flags = AIRTIGHT|FLEXIBLEMATERIAL
	body_parts_covered = FACE
	w_class = ITEM_SIZE_SMALL
	action_button_name = "Adjust mask"
	gas_transfer_coefficient = 0.10
	permeability_coefficient = 0.50
	var/hanging = 0
	style_coverage = COVERS_MOUTH
	style = STYLE_NEG_LOW
	matter = list(MATERIAL_PLASTIC = 1)

/obj/item/clothing/mask/breath/proc/adjust_mask(mob/user)
	if(!usr.incapacitated())
		src.hanging = !src.hanging
		if (src.hanging)
			gas_transfer_coefficient = 1
			body_parts_covered = body_parts_covered & ~FACE
			item_flags = item_flags & ~AIRTIGHT
			icon_state = "pilotdowm"
			to_chat(user, "Your mask is now hanging on your neck.")
		else
			gas_transfer_coefficient = initial(gas_transfer_coefficient)
			body_parts_covered = initial(body_parts_covered)
			item_flags = initial(item_flags)
			icon_state = initial(icon_state)
			to_chat(user, "You pull the mask up to cover your face.")
		update_wear_icon()

/obj/item/clothing/mask/breath/attack_self(mob/user)
	adjust_mask(user)

/obj/item/clothing/mask/breath/verb/toggle()
		set category = "Object"
		set name = "Adjust mask"
		set src in usr

		adjust_mask(usr)

/obj/item/clothing/mask/breath/medical
	desc = "A close-fitting sterile mask that can be connected to an air supply."
	name = "medical mask"
	icon_state = "breath"
	item_state = "breath"
	permeability_coefficient = 0.01
/*
/obj/item/clothing/mask/breath/pilot
	desc = "A breath mask typically used in low pressure industrial environments or aero-spacecraft."
	name = "industrial mask"
	icon_state = "pilot"
	item_state = "pilot"

/obj/item/clothing/mask/breath/pilot/proc/adjust_mask(mob/user)
	if(!usr.incapacitated())
		src.hanging = !src.hanging
		if (src.hanging)
			gas_transfer_coefficient = 1
			body_parts_covered = body_parts_covered & ~FACE
			item_flags = item_flags & ~AIRTIGHT
			icon_state = "pilotdown"
			to_chat(user, "Your mask is now hanging on your neck.")
		else
			gas_transfer_coefficient = initial(gas_transfer_coefficient)
			body_parts_covered = initial(body_parts_covered)
			item_flags = initial(item_flags)
			icon_state = initial(icon_state)
			to_chat(user, "You pull the mask up to cover your face.")
		update_wear_icon()

/obj/item/clothing/mask/breath/pilot/attack_self(mob/user)
	adjust_mask(user)

/obj/item/clothing/mask/breath/pilot/verb/toggle()
		set category = "Object"
		set name = "Adjust mask"
		set src in usr

		adjust_mask(usr)
*/