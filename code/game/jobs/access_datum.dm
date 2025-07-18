/datum/access
	var/id = 0
	var/desc = ""
	var/region = ACCESS_REGION_NONE
	var/access_type = ACCESS_TYPE_STATION

/datum/access/dd_SortValue()
	return "[access_type][desc]"

/*****************
* Station access *
*****************/
/var/const/access_security = 1
/datum/access/security
	id = access_security
	desc = "Security Equipment"
	region = ACCESS_REGION_SECURITY

/var/const/access_brig = 2 // Brig timers and permabrig
/datum/access/holding
	id = access_brig
	desc = "Holding Cells"
	region = ACCESS_REGION_SECURITY

/var/const/access_armory = 3
/datum/access/armory
	id = access_armory
	desc = "Armory"
	region = ACCESS_REGION_SECURITY

/var/const/access_forensics_lockers = 4
/datum/access/forensics_lockers
	id = access_forensics_lockers
	desc = "Forensics"
	region = ACCESS_REGION_SECURITY

/var/const/access_moebius = 5
/datum/access/moebius
	id = access_moebius
	desc = "Moebius General"
	region = ACCESS_REGION_RESEARCH

//same as above but the MBO can assign it
/datum/access/moebius_medical
	id = access_moebius
	desc = "Moebius General"
	region = ACCESS_REGION_MEDBAY

/var/const/access_morgue = 6
/datum/access/morgue
	id = access_morgue
	desc = "Morgue"
	region = ACCESS_REGION_MEDBAY

/var/const/access_tox = 7
/datum/access/tox
	id = access_tox
	desc = "R&D Lab"
	region = ACCESS_REGION_RESEARCH

/var/const/access_tox_storage = 8
/datum/access/tox_storage
	id = access_tox_storage
	desc = "Toxins Lab"
	region = ACCESS_REGION_RESEARCH

/var/const/access_genetics = 9
/datum/access/genetics
	id = access_genetics
	desc = "Genetics Lab"
	region = ACCESS_REGION_MEDBAY

/var/const/access_engine = 10
/datum/access/engine
	id = access_engine
	desc = "Engineering"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_engine_equip = 11
/datum/access/engine_equip
	id = access_engine_equip
	desc = "Engine Room"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_maint_tunnels = 12
/datum/access/maint_tunnels
	id = access_maint_tunnels
	desc = "Maintenance"
	region = ACCESS_REGION_GENERAL

/var/const/access_external_airlocks = 13
/datum/access/external_airlocks
	id = access_external_airlocks
	desc = "External Airlocks"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_emergency_storage = 14
/datum/access/emergency_storage
	id = access_emergency_storage
	desc = "Emergency Storage"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_change_ids = 15
/datum/access/change_ids
	id = access_change_ids
	desc = "Global Change IDs"
	region = ACCESS_REGION_COMMAND

/var/const/access_ai_upload = 16
/datum/access/ai_upload
	id = access_ai_upload
	desc = "AI Upload"
	region = ACCESS_REGION_COMMAND

/var/const/access_teleporter = 17
/datum/access/teleporter
	id = access_teleporter
	desc = "Teleporter"
	region = ACCESS_REGION_COMMAND

/var/const/access_eva = 18
/datum/access/eva
	id = access_eva
	desc = "EVA"
	region = ACCESS_REGION_COMMAND

/var/const/access_heads = 19
/datum/access/heads
	id = access_heads
	desc = "Bridge"
	region = ACCESS_REGION_COMMAND

/var/const/access_captain = 20
/datum/access/captain
	id = access_captain
	desc = "Captain"
	region = ACCESS_REGION_COMMAND

/var/const/access_all_personal_lockers = 21
/datum/access/all_personal_lockers
	id = access_all_personal_lockers
	desc = "Personal Lockers"
	region = ACCESS_REGION_COMMAND

/var/const/access_chapel_office = 22
/datum/access/chapel_office
	id = access_chapel_office
	desc = "Chapel Office"
	region = ACCESS_REGION_CHURCH

/var/const/access_tech_storage = 23
/datum/access/tech_storage
	id = access_tech_storage
	desc = "Technical Storage"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_atmospherics = 24
/datum/access/atmospherics
	id = access_atmospherics
	desc = "Atmospherics"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_bar = 25
/datum/access/bar
	id = access_bar
	desc = "Bar"
	region = ACCESS_REGION_CLUB

/var/const/access_janitor = 26
/datum/access/janitor
	id = access_janitor
	desc = "Custodial Closet"
	region = ACCESS_REGION_CHURCH

/var/const/access_crematorium = 27
/datum/access/crematorium
	id = access_crematorium
	desc = "Crematorium"
	region = ACCESS_REGION_CHURCH

/var/const/access_kitchen = 28
/datum/access/kitchen
	id = access_kitchen
	desc = "Kitchen"
	region = ACCESS_REGION_CLUB

/var/const/access_robotics = 29
/datum/access/robotics
	id = access_robotics
	desc = "Robotics"
	region = ACCESS_REGION_RESEARCH

/var/const/access_rd = 30
/datum/access/rd
	id = access_rd
	desc = "Human Resources Officer"
	region = ACCESS_REGION_RESEARCH

/var/const/access_cargo = 31
/datum/access/cargo
	id = access_cargo
	desc = "Cargo Bay"
	region = ACCESS_REGION_SUPPLY

/var/const/access_construction = 32
/datum/access/construction
	id = access_construction
	desc = "Construction Areas"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_chemistry = 33
/datum/access/chemistry
	id = access_chemistry
	desc = "Chemistry Lab"
	region = ACCESS_REGION_MEDBAY

/var/const/access_cargo_bot = 34
/datum/access/cargo_bot
	id = access_cargo_bot
	desc = "Cargo Bot Delivery"
	region = ACCESS_REGION_SUPPLY

/var/const/access_hydroponics = 35
/datum/access/hydroponics
	id = access_hydroponics
	desc = "Hydroponics"
	region = ACCESS_REGION_CHURCH

/var/const/access_manufacturing = 36
/datum/access/manufacturing
	id = access_manufacturing
	desc = "Manufacturing"
	access_type = ACCESS_TYPE_NONE

// /var/const/free_access_id = 37

// /var/const/free_access_id = 38

/var/const/access_virology = 39
/datum/access/virology
	id = access_virology
	desc = "Virology"
	region = ACCESS_REGION_MEDBAY

/var/const/access_cmo = 40
/datum/access/cmo
	id = access_cmo
	desc = "Moebius Biolab Officer"
	region = ACCESS_REGION_MEDBAY

// /var/const/free_access_id = 39

// /var/const/free_access_id = 40

/var/const/access_merchant = 41
/datum/access/merchant
	id = access_merchant
	desc = "Guild Merchant"
	region = ACCESS_REGION_SUPPLY

/var/const/access_network = 42
/datum/access/network
	id = access_network
	desc = "Station Network"
	region = ACCESS_REGION_RESEARCH

/var/const/access_theatre = 43
/datum/access/theatre
	id = access_theatre
	desc = "Theatre"
	region = ACCESS_REGION_GENERAL

/var/const/access_artist = 44
/datum/access/artist_office
	id = access_artist
	desc = "Club Artist"
	region = ACCESS_REGION_CLUB

/var/const/access_surgery = 45
/datum/access/surgery
	id = access_surgery
	desc = "Surgery"
	region = ACCESS_REGION_MEDBAY

// /var/const/free_access_id = 46

// /var/const/free_access_id = 47

/var/const/access_mining = 48
/datum/access/mining
	id = access_mining
	desc = "Expedition"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_mining_office = 49
/datum/access/mining_office
	id = access_mining_office
	desc = "Expedition Office"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_mailsorting = 50
/datum/access/mailsorting
	id = access_mailsorting
	desc = "Cargo Office"
	region = ACCESS_REGION_SUPPLY

// /var/const/free_access_id = 51

// /var/const/free_access_id = 52

/var/const/access_heads_vault = 53
/datum/access/heads_vault
	id = access_heads_vault
	desc = "Main Vault"
	region = ACCESS_REGION_COMMAND

/var/const/access_mining_station = 54
/datum/access/mining_station
	id = access_mining_station
	desc = "Waystation"
	region = ACCESS_REGION_SUPPLY

/var/const/access_xenobiology = 55
/datum/access/xenobiology
	id = access_xenobiology
	desc = "Xenobiology Lab"
	region = ACCESS_REGION_RESEARCH

/var/const/access_ce = 56
/datum/access/ce
	id = access_ce
	desc = "Chief Engineer"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_hop = 57
/datum/access/hop
	id = access_hop
	desc = "First Officer"
	region = ACCESS_REGION_COMMAND

/var/const/access_hos = 58
/datum/access/hos
	id = access_hos
	desc = "Head of Security"
	region = ACCESS_REGION_SECURITY

/var/const/access_RC_announce = 59 //Request console announcements
/datum/access/RC_announce
	id = access_RC_announce
	desc = "RC Announcements"
	region = ACCESS_REGION_COMMAND

/var/const/access_keycard_auth = 60
/datum/access/keycard_auth
	id = access_keycard_auth
	desc = "Keycode Auth. Device"
	region = ACCESS_REGION_COMMAND

/var/const/access_tcomsat = 61 // has access to the entire telecomms satellite / machinery
/datum/access/tcomsat
	id = access_tcomsat
	desc = "Telecommunications"
	region = ACCESS_REGION_COMMAND

/var/const/access_gateway = 62
/datum/access/gateway
	id = access_gateway
	desc = "Gateway"
	region = ACCESS_REGION_COMMAND

/var/const/access_sec_doors = 63 // Security front doors
/datum/access/sec_doors
	id = access_sec_doors
	desc = "Security"
	region = ACCESS_REGION_SECURITY

/var/const/access_psychiatrist = 64 // Psychiatrist's office
/datum/access/psychiatrist
	id = access_psychiatrist
	desc = "Psychiatrist's Office"
	region = ACCESS_REGION_RESEARCH

/var/const/access_xenoarch = 65
/datum/access/xenoarch
	id = access_xenoarch
	desc = "Xenoarchaeology"
	region = ACCESS_REGION_RESEARCH

/var/const/access_medical_equip = 66
/datum/access/medical_equip
	id = access_medical_equip
	desc = "Medical Equipment"
	region = ACCESS_REGION_MEDBAY

/var/const/access_medspec = 67
/datum/access/medspec
	id = access_medspec
	desc = "Medical Specialist"
	region = ACCESS_REGION_SECURITY

/var/const/access_paramedic = 68 // Paramedic's closet
/datum/access/paramedic
	id = access_paramedic
	desc = "Paramedic's Office"
	region = ACCESS_REGION_MEDBAY

// /var/const/free_access_id = 69

/**************
* NeoTheology *
***************/
/var/const/access_nt_disciple = 70
/datum/access/nt_disciple
	id = access_nt_disciple
	desc = "NeoTheology Disciple"
	region = ACCESS_REGION_CHURCH

/var/const/access_nt_acolyte = 71
/datum/access/nt_acolyte
	id = access_nt_acolyte
	desc = "NeoTheology Acolyte"
	region = ACCESS_REGION_CHURCH

/var/const/access_nt_custodian = 72
/datum/access/nt_custodian
	id = access_nt_custodian
	desc = "NeoTheology Custodian"
	region = ACCESS_REGION_CHURCH

/var/const/access_nt_agrolyte = 73
/datum/access/nt_agrolyte
	id = access_nt_agrolyte
	desc = "NeoTheology Agrolyte"
	region = ACCESS_REGION_CHURCH

/var/const/access_nt_preacher = 74
/datum/access/nt_preacher
	id = access_nt_preacher
	desc = "NeoTheology Preacher"
	region = ACCESS_REGION_CHURCH

/var/const/access_nt_inquisitor = 75
/datum/access/nt_inquisitor
	id = access_nt_inquisitor
	desc = "NeoTheology Inquisitor"
	region = ACCESS_REGION_CHURCH

/****************
* Access Change *
*****************/
/var/const/access_change_medbay = 80
/datum/access/change_medbay
	id = access_change_medbay
	desc = "Medbay Change IDs"
	region = ACCESS_REGION_MEDBAY

/var/const/access_change_engineering = 81
/datum/access/change_engineering
	id = access_change_engineering
	desc = "Engineering Change IDs"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_change_research = 82
/datum/access/change_research
	id = access_change_research
	desc = "Research Change IDs"
	region = ACCESS_REGION_RESEARCH

/var/const/access_change_cargo = 83
/datum/access/change_cargo
	id = access_change_cargo
	desc = "Cargo Change IDs"
	region = ACCESS_REGION_SUPPLY

/var/const/access_change_nt = 84
/datum/access/change_nt
	id = access_change_nt
	desc = "NT Change IDs"
	region = ACCESS_REGION_CHURCH

/var/const/access_change_sec = 85
/datum/access/change_sec
	id = access_change_sec
	desc = "Security Change IDs"
	region = ACCESS_REGION_SECURITY

/var/const/access_change_club = 86
/datum/access/change_club
	id = access_change_club
	desc = "Club Change IDs"
	region = ACCESS_REGION_CLUB

/******************
* Central Command *
******************/
/var/const/access_cent_general = 101//General facilities.
/datum/access/cent_general
	id = access_cent_general
	desc = "Code Grey"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_thunder = 102//Thunderdome.
/datum/access/cent_thunder
	id = access_cent_thunder
	desc = "Code Yellow"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_specops = 103//Special Ops.
/datum/access/cent_specops
	id = access_cent_specops
	desc = "Code Black"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_medical = 104//Medical/Research
/datum/access/cent_medical
	id = access_cent_medical
	desc = "Code White"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_living = 105//Living quarters.
/datum/access/cent_living
	id = access_cent_living
	desc = "Code Green"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_storage = 106//Generic storage areas.
/datum/access/cent_storage
	id = access_cent_storage
	desc = "Code Orange"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_teleporter = 107//Teleporter.
/datum/access/cent_teleporter
	id = access_cent_teleporter
	desc = "Code Blue"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_creed = 108//Creed's office.
/datum/access/cent_creed
	id = access_cent_creed
	desc = "Code Silver"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_captain = 109//Captain's office/ID comp/AI.
/datum/access/cent_captain
	id = access_cent_captain
	desc = "Code Gold"
	access_type = ACCESS_TYPE_CENTCOM
/var/const/access_research_equipment = 110 //RnD Console Access
/datum/access/research_equipment
	id = access_research_equipment
	desc = "Research Console"
	region = ACCESS_REGION_RESEARCH
/***************
* Antag access *
***************/
/var/const/access_mercenary = 150//Merc ship and base access
/datum/access/mercenary
	id = access_mercenary
	access_type = ACCESS_TYPE_SYNDICATE

/var/const/access_pirate = 145 //Pirate ship and base
/datum/access/pirate
	id = access_pirate
	access_type = ACCESS_TYPE_SYNDICATE

/var/const/access_syndicate = 140//General Syndicate Access
/datum/access/syndicate
	id = access_syndicate
	access_type = ACCESS_TYPE_SYNDICATE
/*******
* Misc *
*******/
/var/const/access_synth = 199
/datum/access/synthetic
	id = access_synth
	desc = "Synthetic"
	access_type = ACCESS_TYPE_NONE

/var/const/access_crate_cash = 200
/datum/access/crate_cash
	id = access_crate_cash
	access_type = ACCESS_TYPE_NONE