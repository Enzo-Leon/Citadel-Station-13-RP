/obj/item/weapon/weldpack
	name = "Welding kit"
	desc = "A heavy-duty, portable welding fluid carrier."
	slot_flags = SLOT_BACK
	icon = 'icons/obj/storage.dmi'
	icon_state = "welderpack"
	w_class = ITEMSIZE_LARGE
	var/max_fuel = 350
	var/obj/item/weapon/nozzle = null //Attached welder, or other spray device.
	var/nozzle_attached = 0

/obj/item/weapon/weldpack/Initialize()
	. = ..()
	var/datum/reagents/R = new/datum/reagents(max_fuel) //Lotsa refills
	reagents = R
	R.my_atom = src
	R.add_reagent("fuel", max_fuel)
	nozzle = new/obj/item/weapon/weldingtool/tubefed(src)
	nozzle_attached = 1

/obj/item/weapon/weldpack/Destroy()
	qdel(nozzle)
	nozzle = null
	return ..()

/obj/item/weapon/weldpack/dropped(mob/user)
	..()
	if(nozzle)
		user.remove_from_mob(nozzle)
		return_nozzle()
		to_chat(user, "<span class='notice'>\The [nozzle] retracts to its fueltank.</span>")

/obj/item/weapon/weldpack/proc/get_nozzle(var/mob/living/user)
	if(!ishuman(user))
		return 0

	var/mob/living/carbon/human/H = user

	if(H.hands_are_full()) //Make sure our hands aren't full.
		to_chat(H, "<span class='warning'>Your hands are full.  Drop something first.</span>")
		return 0

	var/obj/item/weapon/F = nozzle
	H.put_in_hands(F)
	nozzle_attached = 0

	return 1

/obj/item/weapon/weldpack/proc/return_nozzle(var/mob/living/user)
	nozzle.forceMove(src)
	nozzle_attached = 1

/obj/item/weapon/weldpack/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/weldingtool) && !(W == nozzle))
		var/obj/item/weapon/weldingtool/T = W
		if(T.welding & prob(50))
			message_admins("[key_name_admin(user)] triggered a fueltank explosion.")
			log_game("[key_name(user)] triggered a fueltank explosion.")
			to_chat(user,"<span class='danger'>That was stupid of you.</span>")
			explosion(get_turf(src),-1,0,2)
			if(src)
				qdel(src)
			return
		else if(T.status)
			if(T.welding)
				to_chat(user,"<span class='danger'>That was close!</span>")
			src.reagents.trans_to_obj(W, T.max_fuel)
			to_chat(user, "<span class='notice'>Welder refilled!</span>")
			playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)
			return
	else if(nozzle)
		if(nozzle == W)
			if(!user.unEquip(W))
				to_chat(user,"<span class='notice'>\The [W] seems to be stuck to your hand.</span>")
				return
			if(!nozzle_attached)
				return_nozzle()
				to_chat(user,"<span class='notice'>You attach \the [W] to the [src].</span>")
				return
		else
			to_chat(user,"<span class='notice'>The [src] already has a nozzle!</span>")
	else
		to_chat(user,"<span class='warning'>The tank scoffs at your insolence. It only provides services to welders.</span>")
	return

/obj/item/weapon/weldpack/attack_hand(mob/user as mob)
	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/wearer = user
		if(wearer.back == src)
			if(nozzle && nozzle_attached)
				if(!wearer.incapacitated())
					get_nozzle(user)
			else
				to_chat(user,"<span class='notice'>\The [src] does not have a nozzle attached!</span>")
		else
			..()
	else
		..()

/obj/item/weapon/weldpack/afterattack(obj/O as obj, mob/user as mob, proximity)
	if(!proximity) // this replaces and improves the get_dist(src,O) <= 1 checks used previously
		return
	if (istype(O, /obj/structure/reagent_dispensers/fueltank) && src.reagents.total_volume < max_fuel)
		O.reagents.trans_to_obj(src, max_fuel)
		to_chat(user,"<span class='notice'>You crack the cap off the top of the pack and fill it back up again from the tank.</span>")
		playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)
		return
	else if (istype(O, /obj/structure/reagent_dispensers/fueltank) && src.reagents.total_volume == max_fuel)
		to_chat(user,"<span class='warning'>The pack is already full!</span>")
		return

/obj/item/weapon/weldpack/examine(mob/user)
	..(user)
	user << text("\icon[] [] units of fuel left!", src, src.reagents.total_volume)
	return
