// Smol but fast variant of the golem
/mob/living/carbon/superior_animal/aetherium_golem/runtling
	name = "aetherium runtling"
	desc = "A weird creature made of aetherium. It is smaller and weaker, but numerous and fast."
	icon_state = "golem_aetherium_blue"
	health = 75
	maxHealth = 75
	move_to_delay = 1 // Very fast
	armor = list(melee = 20, bullet = 10, energy = 25, bomb = 15, bio = 100, rad = 100) //We want to be gunned down, not lasered
	drop_amount = 1
	size_factor = 0.75 // 25% Smaller
