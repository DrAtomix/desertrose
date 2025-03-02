#define INFINITE -1

/obj/item/autosurgeon
	name = "autosurgeon"
	desc = "A device that automatically inserts an implant or organ into the user without the hassle of extensive surgery. It has a slot to insert implants/organs and a screwdriver slot for removing accidentally added items."
	icon = 'icons/obj/device.dmi'
	icon_state = "autoimplanter"
	item_state = "nothing"
	w_class = WEIGHT_CLASS_SMALL
	var/obj/item/organ/storedorgan
	var/organ_type = /obj/item/organ
	var/uses = INFINITE
	var/starting_organ

/obj/item/autosurgeon/Initialize(mapload)
	. = ..()
	if(starting_organ)
		insert_organ(new starting_organ(src))

/obj/item/autosurgeon/proc/insert_organ(obj/item/organ/I)
	storedorgan = I
	I.forceMove(src)
	I.organ_flags |= ORGAN_FROZEN //Stops decay
	name = "[initial(name)] ([storedorgan.name])"

/obj/item/autosurgeon/attack_self(mob/user)//when the object it used...
	if(!uses)
		to_chat(user, "<span class='warning'>[src] has already been used. The tools are dull and won't reactivate.</span>")
		return
	else if(!storedorgan)
		to_chat(user, "<span class='notice'>[src] currently has no implant stored.</span>")
		return
	storedorgan.Insert(user)//insert stored organ into the user
	user.visible_message("<span class='notice'>[user] presses a button on [src], and you hear a short mechanical noise.</span>", "<span class='notice'>You feel a sharp sting as [src] plunges into your body.</span>")
	playsound(get_turf(user), 'sound/weapons/circsawhit.ogg', 50, 1)
	storedorgan = null
	name = initial(name)
	if(uses != INFINITE)
		uses--
	if(!uses)
		desc = "[initial(desc)] Looks like it's been used up."

/obj/item/autosurgeon/attack_self_tk(mob/user)
	return //stops TK fuckery

/obj/item/autosurgeon/attackby(obj/item/I, mob/user, params)
	if(istype(I, organ_type))
		if(storedorgan)
			to_chat(user, "<span class='notice'>[src] already has an implant stored.</span>")
			return
		else if(!uses)
			to_chat(user, "<span class='notice'>[src] has already been used up.</span>")
			return
		if(!user.transferItemToLoc(I, src))
			return
		storedorgan = I
		to_chat(user, "<span class='notice'>You insert the [I] into [src].</span>")
	else
		return ..()

/obj/item/autosurgeon/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if(!storedorgan)
		to_chat(user, "<span class='notice'>There's no implant in [src] for you to remove.</span>")
	else
		var/atom/drop_loc = user.drop_location()
		for(var/J in src)
			var/atom/movable/AM = J
			AM.forceMove(drop_loc)

		to_chat(user, "<span class='notice'>You remove the [storedorgan] from [src].</span>")
		I.play_tool_sound(src)
		storedorgan = null
		if(uses != INFINITE)
			uses--
		if(!uses)
			desc = "[initial(desc)] Looks like it's been used up."
	return TRUE

/obj/item/autosurgeon/cmo
	desc = "A single use autosurgeon that contains a medical heads-up display augment. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/cyberimp/eyes/hud/medical

/obj/item/autosurgeon/gloweyes
	desc = "A single use autosurgeon that contains a set of Luminescent Eyes augments. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/eyes/robotic/glow

/obj/item/autosurgeon/surgery
	starting_organ = /obj/item/organ/cyberimp/arm/surgery
	desc = "A single use autosurgeon that contains a surgery toolset augment. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1

/obj/item/autosurgeon/toolset
	starting_organ = /obj/item/organ/cyberimp/arm/toolset
	desc = "A single use autosurgeon that contains a toolset augment. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1

/obj/item/autosurgeon/thermal_eyes
	starting_organ = /obj/item/organ/eyes/robotic/thermals

/obj/item/autosurgeon/xray_eyes
	starting_organ = /obj/item/organ/eyes/robotic/xray

/obj/item/autosurgeon/anti_stun
	starting_organ = /obj/item/organ/cyberimp/brain/anti_stun

/obj/item/autosurgeon/reviver
	starting_organ = /obj/item/organ/cyberimp/chest/reviver

/obj/item/autosurgeon/anti_drop
	starting_organ = /obj/item/organ/cyberimp/brain/anti_drop

//BOX O' IMPLANTS

/obj/item/storage/box/cyber_implants
	name = "boxed cybernetic implants"
	desc = "A sleek, sturdy box."
	icon_state = "syndiebox"
	illustration = "cyber_implants"
	var/list/boxed = list(
		/obj/item/autosurgeon/thermal_eyes,
		/obj/item/autosurgeon/xray_eyes,
		/obj/item/autosurgeon/anti_stun,
		/obj/item/autosurgeon/reviver)
	var/amount = 5

/obj/item/storage/box/cyber_implants/PopulateContents()
	var/implant
	while(contents.len <= amount)
		implant = pick(boxed)
		new implant(src)

/obj/item/autosurgeon/penis
	desc = "A single use autosurgeon that contains a penis. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/genital/penis

/obj/item/autosurgeon/testicles
	desc = "A single use autosurgeon that contains a set of testicles. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/genital/testicles

/obj/item/autosurgeon/vagina
	desc = "A single use autosurgeon that contains a vagina. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/genital/vagina

/obj/item/autosurgeon/breasts
	desc = "A single use autosurgeon that contains a set of breasts. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/genital/breasts

/obj/item/autosurgeon/womb
	desc = "A single use autosurgeon that contains a womb. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/genital/womb
