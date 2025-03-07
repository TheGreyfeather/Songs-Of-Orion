// Beefier variant of the golem
/mob/living/carbon/superior_animal/aetherium_golem/behemoth
	name = "aetherium behemoth"
	desc = "A weird creature made of aetherium. It is bigger, stronger and pack a harder punch than its brethen."
	icon_state = "golem_aetherium_purple"
	health = 500
	maxHealth = 500
	melee_damage_lower = 40
	melee_damage_upper = 50
	move_to_delay = 2
	armor = list(melee = 70, bullet = 60, energy = 80, bomb = 40, bio = 100, rad = 100) //We want to be gunned down, not lasered
	drop_amount = 3
	size_factor = 1.25 // 25% bigger

/mob/living/carbon/superior_animal/aetherium_golem/behemoth/attack_hand(mob/living/carbon/M as mob)
	if(M.a_intent == I_GRAB || M.a_intent == I_DISARM)
		visible_message(SPAN_WARNING("[src] punch [M] when \he stupidly try to grab it!"))
		UnarmedAttack(M, 1)
		var/throwdir = get_dir(src, M)
		M.throw_at(get_edge_target_turf(M, throwdir), rand(3,6), 30)
	else
		..()
