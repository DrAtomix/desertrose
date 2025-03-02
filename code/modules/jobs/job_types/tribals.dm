/datum/job/tribals //do NOT use this for anything, it's just to store faction datums
	department_flag = TRIBAL
	selection_color = "#ffeeaa"
	forbids = "The use of pre-war technology, especially prewar weapons of war."
	enforces = "The tribe operate as if they are a part of a singular clan. Any harm dealt upon another member is likened to harm placed upon your brother or sister. Above all things, the tribe comes first."
	objectivesList = list("Leadership recommends the following goal for this week: Recruit worthy outlanders into the tribe","Leadership recommends the following goal for this week: Hunt dangerous creatures to improve the clan's standing", "Leadership recommends the following goal for this week: Preserve dangerous technology to prevent it from falling into the wrong hands.")

/datum/outfit/job/tribal/
	name = "TRIBALdatums"
	jobtype = /datum/job/tribal/
	shoes = 		/obj/item/clothing/shoes/f13/rag
	gloves =        /obj/item/clothing/gloves/f13/handwraps
	backpack = 	/obj/item/storage/backpack/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	id = null
	box = /obj/item/storage/survivalkit_tribal
	ears = null

/datum/outfit/job/tribal/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TRAPPER, src)
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, src)
	H.grant_language(/datum/language/wayfarer)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/heavytribe)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribe_armor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ritual)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalshield)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/warclub)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/warmace)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/arrowpoison)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/arrowburn)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/deathclawspear)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/sturdybow)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/silverbow)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/bonebow)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/hydra)

/*
Tribal Chief
*/
/datum/job/tribal/f13chief
	title = "Chief"
	flag = F13CHIEF
	department_flag = TRIBAL
	faction = "Village"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Elders of the tribe."
	enforces = "The ways of the Machine spirits."
	forbids = "Abusing technology and using Pre-War weapons."
	description = "The leader and central political figure in the Wayfarer Tribe. You engage in diplomatic meetings with the powers present within the Region to ensure the village's safety and independence."
	selection_color = "#006666"
	outfit = /datum/outfit/job/tribal/f13chief

	access = list(ACCESS_TRIBE)
	minimal_access = list(ACCESS_TRIBE)

/datum/outfit/job/tribal/f13chief/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/tribal/f13chief
	name = "Chief"
	jobtype = /datum/job/tribal/f13chief
	head = 			/obj/item/clothing/head/helmet/f13/wayfarer/chief/green
	uniform = 		/obj/item/clothing/under/f13/wayfarer/hunter
	belt = 			/obj/item/storage/backpack/spearquiver
	neck =			/obj/item/clothing/neck/cloak/chiefcloak
	id = 			/obj/item/card/id/tribetattoo
	suit =			/obj/item/clothing/suit/hooded/cloak/hhunter
	suit_store =	/obj/item/twohanded/spear/bonespear/deathclaw
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=1,
		/obj/item/reagent_containers/pill/patch/healingpowder=2,
		/obj/item/stack/medical/gauze=1,
		/obj/item/flashlight/lantern=1)

/*
Tribal Shaman
*/
/datum/job/tribal/f13shaman
	title = "Shaman"
	flag = F13SHAMAN
	department_flag = TRIBAL
	faction = "Village"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Elders of the tribe and the chief."
	enforces = "The ways of the Machine spirits."
	forbids = "Abusing technology and using Pre-War weapons."
	description = "The spiritual leader and cultural core of the Wayfarer Tribe. You aid villagers in their day to day lives by offering guidance and advice, while also acting as the direct aid to the chief. You are the guardian of the tribe's customs, their health, and knowledge."
	selection_color = "#006666"

	outfit = /datum/outfit/job/tribal/f13shaman

	access = list(ACCESS_TRIBE)
	minimal_access = list(ACCESS_TRIBE)

	loadout_options = list(
		/datum/outfit/loadout/invoker, //Red shaman
		/datum/outfit/loadout/ascetic, //Blue shaman
	)

/datum/outfit/job/tribal/f13shaman/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SPIRITUAL, src)

/datum/outfit/job/tribal/f13shaman
	name = "Shaman"
	jobtype = /datum/job/tribal/f13shaman
	uniform = 	/obj/item/clothing/under/f13/tribe
	gloves = 	/obj/item/clothing/gloves/f13/handwraps
	shoes = 	/obj/item/clothing/shoes/sandal
	r_hand = 	/obj/item/twohanded/sledgehammer/shamanstaff
	id = 		/obj/item/card/id/tribetattoo
	backpack_contents = list(
		/obj/item/smelling_salts/wayfarer=1,
		/obj/item/reagent_containers/glass/mortar=1,
		/obj/item/pestle=1,
		/obj/item/reagent_containers/glass/primitive_chem_isolator=1,
		/obj/item/reagent_containers/pill/patch/healpoultice=2,
		/obj/item/storage/bag/chemistry/tribal=1
	)

/datum/outfit/job/tribal/f13shaman/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)

/datum/outfit/loadout/invoker
	name = "Invoker"
	backpack_contents = list(
		/obj/item/clothing/head/helmetf13/wayfarer/shamanred=1,
		/obj/item/clothing/under/f13/wayfarer/shamanred=1
	)

/datum/outfit/loadout/ascetic
	name = "Ascetic"
	backpack_contents = list(
		/obj/item/clothing/head/helmet/f13/wayfarer/shamanblue=1,
		/obj/item/clothing/under/f13/wayfarer/shamanblue=1
	)

/*
Tribal Head Hunter
*/
/datum/job/tribal/f13Hhunter
	title = "Head Hunter"
	flag = F13HHUNTER
	department_flag = TRIBAL
	faction = "Village"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Elders of the tribe and the chief."
	enforces = "The ways of the Machine spirits."
	forbids = "Abusing technology and using Pre-War weapons."
	description = "You are the village Head Hunter; you organize the hunters of the tribe and are the authority in matters of protecting the tribe and the land of the Wayfarers. You lead the Great Hunts and War-Bands in time of conflict."
	selection_color = "#006666"

	outfit = /datum/outfit/job/tribal/f13Hhunter
	access = list(ACCESS_TRIBE)
	minimal_access = list(ACCESS_TRIBE)

/datum/outfit/job/tribal/f13Hhunter/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/tribal/f13Hhunter
	name = "Hunter"
	jobtype = /datum/job/tribal/f13Hhunter
	uniform = 	/obj/item/clothing/under/f13/wayfarer/hunter
	suit = 		/obj/item/clothing/suit/hooded/cloak/hhunter
	belt = 		/obj/item/melee/transforming/cleaving_saw
	id = 		/obj/item/card/id/tribetattoo
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=1,
		/obj/item/reagent_containers/pill/patch/healingpowder=2,
		/obj/item/stack/medical/gauze=1,
		/obj/item/flashlight/flare/torch=1)

/*
Druid
*/

/datum/job/tribal/f13druid
	title = "Druid"
	flag = F13DRUID
	department_flag = TRIBAL
	faction = "Village"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Chief and the Shaman."
	enforces = "The ways of the Machine spirits."
	forbids = "Abusing technology and using Pre-War weapons."
	description = "You are a Druid in the tribe; you perform rituals, and bless pre-war relics and other artifacts for the tribe to use. You also are the spiritual guides of the tribe, and work with the Shaman during rituals or other spiritual matters."
	selection_color = "#006666"
	exp_requirements = 600
	exp_type = EXP_TYPE_TRIBAL

	outfit = /datum/outfit/job/tribal/f13druid
	access = list(ACCESS_TRIBE)
	minimal_access = list(ACCESS_TRIBE)

/datum/outfit/job/tribal/f13druid/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SPIRITUAL, src)
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)

/datum/outfit/job/tribal/f13druid
	name = "Druid"
	jobtype = /datum/job/tribal/f13druid
	head = 		/obj/item/clothing/head/helmet/f13/wayfarer/antler
	uniform = 	/obj/item/clothing/under/f13/wayfarer/acolyte
	gloves = 	/obj/item/clothing/gloves/f13/handwraps
	shoes = 	/obj/item/clothing/shoes/sandal
	id = 		/obj/item/card/id/tribetattoo
	backpack_contents = list(
		/obj/item/reagent_containers/glass/mortar=1,
		/obj/item/pestle=1,
		/obj/item/reagent_containers/glass/primitive_chem_isolator=1,
		/obj/item/reagent_containers/pill/patch/healpoultice=2,
		/obj/item/storage/bag/chemistry/tribal=1)

/*
Villager
*/

/datum/job/tribal/f13villager
	title = "Villager"
	flag = F13VILLAGER
	department_flag = TRIBAL
	faction = "Village"
	total_positions = 6
	spawn_positions = 6
	supervisors = "Tribal Chief, Shaman and Headhunter"
	description = "A proud member of the Wayfarer tribe, you do what needs to be done to ensure the survival of yourself and your people while following the laws of the tribe."
	selection_color = "#006666"

	outfit = /datum/outfit/job/tribal/f13villager

	access = list(ACCESS_TRIBE)
	minimal_access = list(ACCESS_TRIBE)

	loadout_options = list(
		/datum/outfit/loadout/gatherer, //Bone Spear, Bone Knife, Healing powder
		/datum/outfit/loadout/gardener,
		/datum/outfit/loadout/mender,	//Ritual dagger, Improvized gauze, Healing powders, Mortar
		/datum/outfit/loadout/craftsman, //Crude tools
	)

/datum/job/tribals/f13villager/after_spawn(mob/living/carbon/human/H, mob/M)

/datum/outfit/job/tribal/f13villager
	name = "Villager"
	jobtype = /datum/job/tribal/f13villager
	uniform = 	/obj/item/clothing/under/f13/wayfarer
	gloves = 	/obj/item/clothing/gloves/f13/handwraps
	shoes = 	/obj/item/clothing/shoes/sandal
	id = 		/obj/item/card/id/tribetattoo
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder=1,
		/obj/item/stack/medical/gauze=1,
		/obj/item/flashlight/flare/torch=1)

/datum/outfit/loadout/gatherer
	name = "Gatherer"
	backpack_contents = list(
		/obj/item/twohanded/spear/bonespear=1,
		/obj/item/kitchen/knife/combat/bone=1,
		/obj/item/reagent_containers/pill/patch/healingpowder=1
	)

/datum/outfit/loadout/gardener
	name = "Gardener"
	backpack_contents = list(
		/obj/item/scythe=1,
		/obj/item/storage/bag/plants=1,
		/obj/item/cultivator=1,
		/obj/item/reagent_containers/glass/bucket/wood=1
	)

/datum/outfit/loadout/mender
	name = "Mender"
	backpack_contents = list(
		/obj/item/kitchen/knife/ritualdagger=1,
		/obj/item/stack/medical/gauze/improvised=1,
		/obj/item/reagent_containers/pill/patch/healingpowder=2,
		/obj/item/reagent_containers/glass/mortar=1,
		/obj/item/pestle=1
	)

/datum/outfit/loadout/craftsman
	name = "Craftsman"
	backpack_contents = list(
		/obj/item/storage/belt/utility=1,
		/obj/item/crowbar/crude=1,
		/obj/item/wrench/crude=1,
		/obj/item/wirecutters/crude=1,
		/obj/item/weldingtool/crude=1
	)

/*
Hunter
*/
/datum/job/tribal/f13hunter
	title = "Hunter"
	flag = F13HUNTER
	department_flag = TRIBAL
	faction = "Village"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The chief and Head Hunter."
	enforces = "The ways of the Machine spirits."
	forbids = "Abusing technology and using Pre-War weapons."
	description = "You are a Hunter for the tribe; you bring back food and relics, anything that may house a machine spirit that can be purified by the shaman. You also are the protectors of the tribe, and work with the Head Hunter during Great Hunts or times of War."
	selection_color = "#006666"

	exp_requirements = 600
	exp_type = EXP_TYPE_TRIBAL

	outfit = /datum/outfit/job/tribal/f13hunter

	access = list(ACCESS_TRIBE)
	minimal_access = list(ACCESS_TRIBE)

	loadout_options = list(
		/datum/outfit/loadout/ranged, //Bow and quiver, Bone knife, Healing powder
		/datum/outfit/loadout/melee, //Deathclaw Bone Spear, Bone knife, Healing powder
	)

/datum/outfit/job/tribal/f13hunter/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/tribal/f13hunter
	name = "Hunter"
	jobtype = /datum/job/tribal/f13hunter
	head = 		/obj/item/clothing/head/helmet/f13/wayfarer/hunter
	uniform = 	/obj/item/clothing/under/f13/wayfarer/hunter
	gloves = 	/obj/item/clothing/gloves/f13/handwraps
	shoes = 	/obj/item/clothing/shoes/f13/rag
	suit = 		/obj/item/clothing/suit/armor/f13/tribe_armor
	id = 		/obj/item/card/id/tribetattoo
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder=2,
		/obj/item/stack/medical/gauze=1,
		/obj/item/flashlight/flare/torch=1)

/datum/outfit/loadout/ranged
	name = "Ranged"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/tribalbow=1,
		/obj/item/storage/belt/tribe_quiver=1,
		/obj/item/kitchen/knife/combat/bone=1,
		/obj/item/reagent_containers/pill/patch/healingpowder=1
	)

/datum/outfit/loadout/melee
	name = "Melee"
	backpack_contents = list(
		/obj/item/twohanded/spear/bonespear/deathclaw=1,
		/obj/item/kitchen/knife/combat/bone=1,
		/obj/item/reagent_containers/pill/patch/healingpowder=1
	)

/*
Spirit-Pledged
*/
/datum/job/tribal/f13spiritpledged
	title = "Spirit-Pledged"
	flag = F13SPIRITPLEDGED
	department_flag = TRIBAL
	faction = "Village"
	total_positions = 2
	spawn_positions = 2
	supervisors = "All other tribals."
	description = "An outsider to the tribe, you have been welcomed to learn their ways and grow closer to their culture and lifestyle."
	selection_color = "#006666"

	outfit = /datum/outfit/job/tribal/f13spiritpledged

	access = list(ACCESS_TRIBE)
	minimal_access = list(ACCESS_TRIBE)

/datum/outfit/job/tribal/f13spiritpledged
	name = "Spirit-Pledged"
	jobtype = /datum/job/tribal/f13spiritpledged
	uniform =	/obj/item/clothing/under/f13/wayfarer
	id = 		/obj/item/card/id/tribetattoo
