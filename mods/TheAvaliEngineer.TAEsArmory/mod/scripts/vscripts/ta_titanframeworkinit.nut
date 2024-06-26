global function TA_TitanFramework_UIInit
void function TA_TitanFramework_UIInit() {
	#if TARMORY_HAS_TITANFRAMEWORK
	//	font is "alligator"

	//	      :::       ::: :::   ::: :::     ::: :::::::::: :::::::::  ::::    :::
	//	     :+:       :+: :+:   :+: :+:     :+: :+:        :+:    :+: :+:+:   :+:
	//	    +:+       +:+  +:+ +:+  +:+     +:+ +:+        +:+    +:+ :+:+:+  +:+
	//	   +#+  +:+  +#+   +#++:   +#+     +:+ +#++:++#   +#++:++#:  +#+ +:+ +#+
	//	  +#+ +#+#+ +#+    +#+     +#+   +#+  +#+        +#+    +#+ +#+  +#+#+#
	//	  #+#+# #+#+#     #+#      #+#+#+#   #+#        #+#    #+# #+#   #+#+#
	//	  ###   ###      ###        ###     ########## ###    ### ###    ####

	ModdedTitanData Wyvern

	//	Menu text
	Wyvern.Name = "#DEFAULT_TITAN_WYVERN"
	Wyvern.Description = "Your mother"
	Wyvern.passiveDisplayNameOverride = "#TITAN_OS_WYVERN_NAME"

	//	Menu hints
	Wyvern.difficulty = 2
	Wyvern.speedStat = 3
	Wyvern.damageStat = 2
	Wyvern.healthStat = 1
	Wyvern.titanHints = ["WIP"]

	//	Images

	//	Base titan
	Wyvern.BaseSetFile = "titan_stryder_sniper"
	Wyvern.BaseName = "northstar"
	Wyvern.startsAsPrime = false

	Wyvern.altChassisType = frameworkAltChassisMethod.NONE

	//	Weapon
	ModdedTitanWeaponAbilityData AutoRocket
	AutoRocket.custom = true
	AutoRocket.weaponName = "ta_wyvern_titanweapon_autorocket"
	AutoRocket.displayName = "#TA_TITAN_WYVERN_WEAPON_AUTOROCKET"
	AutoRocket.description = "#TA_TITAN_WYVERN_WEAPON_AUTOROCKET_DESC"
	AutoRocket.image = $"ui/temp"
	Wyvern.Primary = AutoRocket

	//	Tactical
	ModdedTitanWeaponAbilityData WyvernThrusters
	WyvernThrusters.custom = true
	WyvernThrusters.weaponName = "ta_wyvern_titanweapon_thrusters"
	WyvernThrusters.displayName = "#TA_TITAN_WYVERN_TACTICAL_THRUSTERS"
	WyvernThrusters.description = "#TA_TITAN_WYVERN_TACTICAL_THRUSTERS_DESC"
	WyvernThrusters.image = $"ui/temp"
	Wyvern.Mid = WyvernThrusters

	//	Ordinance
	ModdedTitanWeaponAbilityData ChargeBall
	ChargeBall.custom = true
	ChargeBall.weaponName = "mp_titanweapon_charge_ball"
	ChargeBall.displayName = "#WPN_TITAN_CHARGE_BALL"
	ChargeBall.description = "#WPN_TITAN_CHARGE_BALL_DESC"
	ChargeBall.image = $"archon/menu/charge_ball"
	Wyvern.Right = ChargeBall

	//	Defensive
	ModdedTitanWeaponAbilityData TitanCloak2
	TitanCloak2.custom = true
	TitanCloak2.weaponName = "ta_geist_titanability_titancloak" //"ta_wyvern_titanability_flight"
	TitanCloak2.displayName = "#TA_TITAN_GEIST_DEFENSIVE_TITANCLOAK"
	TitanCloak2.description = "#TA_TITAN_GEIST_DEFENSIVE_TITANCLOAK_DESC"
	TitanCloak2.image = $"ui/temp"
	Wyvern.Left = TitanCloak2

	//	Core
	ModdedTitanWeaponAbilityData StormCore
	StormCore.custom = true
	StormCore.displayName = "#TITANCORE_STORM"
	StormCore.weaponName = "mp_titancore_storm_core"
	StormCore.description = "#TITANCORE_STORM_DESC"
	StormCore.image = $"archon/hud/storm_core"
	Wyvern.Core = StormCore
	//*/

	CreateModdedTitanSimple(Wyvern)


	//		  	   	::::::::  :::::::::: ::::::::::: :::::::: :::::::::::
	//		      :+:    :+: :+:            :+:    :+:    :+:    :+:
	//		     +:+        +:+            +:+    +:+           +:+
	//		    :#:        +#++:++#       +#+    +#++:++#++    +#+
	//		   +#+   +#+# +#+            +#+           +#+    +#+
	//		  #+#    #+# #+#            #+#    #+#    #+#    #+#
	//		  ########  ########## ########### ########     ###

	ModdedTitanData Geist

	//	Menu text
	Geist.Name = "#DEFAULT_TITAN_GEIST"
	Geist.Description = "Your father"
	Geist.passiveDisplayNameOverride = "#TITAN_OS_GEIST_NAME"

	//	Menu hints
	Geist.difficulty = 2
	Geist.speedStat = 3
	Geist.damageStat = 2
	Geist.healthStat = 1
	Geist.titanHints = ["WIP"]

	//	Images

	//	Base titan
	Geist.BaseSetFile = "titan_stryder_leadwall"	//	titan_stryder_shotgun
	Geist.BaseName = "ronin"
	Geist.startsAsPrime = false

	Geist.altChassisType = frameworkAltChassisMethod.NONE

	//	Weapon
	ModdedTitanWeaponAbilityData HeavyShotgun
	HeavyShotgun.custom = true
	HeavyShotgun.weaponName = "ta_geist_titanweapon_burstsg"
	HeavyShotgun.displayName = "#TA_TITAN_GEIST_WEAPON_BURSTSG"
	HeavyShotgun.description = "#TA_TITAN_GEIST_WEAPON_BURSTSG_DESC"
	HeavyShotgun.image = $"ui/temp"
	Geist.Primary = HeavyShotgun

	//	Tactical
	ModdedTitanWeaponAbilityData Holo
	Holo.custom = true
	Holo.weaponName = "ta_geist_titanability_holodistract"
	Holo.displayName = "#TA_TITAN_GEIST_TACTICAL_HOLODISTRACT"
	Holo.description = "#TA_TITAN_GEIST_TACTICAL_HOLODISTRACT_DESC"
	Holo.image = $"ui/temp"
	Geist.Mid = Holo

	//	Ordinance
	ModdedTitanWeaponAbilityData ChargeBall2
	ChargeBall2.custom = true
	ChargeBall2.weaponName = "mp_titanweapon_charge_ball"
	ChargeBall2.displayName = "#WPN_TITAN_CHARGE_BALL"
	ChargeBall2.description = "#WPN_TITAN_CHARGE_BALL_DESC"
	ChargeBall2.image = $"archon/menu/charge_ball"
	Geist.Right = ChargeBall2

	//	Defensive
	ModdedTitanWeaponAbilityData TitanCloak
	TitanCloak.custom = true
	TitanCloak.weaponName = "ta_geist_titanability_titancloak"
	TitanCloak.displayName = "#TA_TITAN_GEIST_DEFENSIVE_TITANCLOAK"
	TitanCloak.description = "#TA_TITAN_GEIST_DEFENSIVE_TITANCLOAK_DESC"
	TitanCloak.image = $"ui/temp"
	Geist.Left = TitanCloak

	//	Core
	ModdedTitanWeaponAbilityData StormCore2
	StormCore2.custom = true
	StormCore2.weaponName = "mp_titancore_storm_core"
	StormCore2.displayName = "#TITANCORE_STORM"
	StormCore2.description = "#TITANCORE_STORM_DESC"
	StormCore2.image = $"archon/hud/storm_core"
	Geist.Core = StormCore2
	//*/

	CreateModdedTitanSimple(Geist)

	//			  :::   :::    ::::::::  ::::::::: ::::::::::: :::     :::::::::
	//			:+:+: :+:+:  :+:    :+: :+:    :+:    :+:   :+: :+:   :+:    :+:
	//		  +:+ +:+:+ +:+ +:+    +:+ +:+    +:+    +:+  +:+   +:+  +:+    +:+
	//		 +#+  +:+  +#+ +#+    +:+ +#++:++#:     +#+ +#++:++#++: +#++:++#:
	//		+#+       +#+ +#+    +#+ +#+    +#+    +#+ +#+     +#+ +#+    +#+
	//	   #+#       #+# #+#    #+# #+#    #+#    #+# #+#     #+# #+#    #+#
	//	  ###       ###  ########  ###    ###    ### ###     ### ###    ###

	ModdedTitanData Mortar

	//	Menu text
	Mortar.Name = "#DEFAULT_TITAN_MORTAR"
	Mortar.Description = "Your uncle"
	Mortar.passiveDisplayNameOverride = "#TITAN_OS_MORTAR_NAME"

	//	Menu hints
	Mortar.difficulty = 3
	Mortar.speedStat = 1
	Mortar.damageStat = 3
	Mortar.healthStat = 3
	Mortar.titanHints = ["WIP"]

	//	Images

	//	Base titan
	Mortar.BaseSetFile = "titan_ogre_legion_prime"	//	titan_atlas_tracker_mortar
	Mortar.BaseName = "legion"
	Mortar.startsAsPrime = true

	Mortar.altChassisType = frameworkAltChassisMethod.NONE

	//	Weapon
	ModdedTitanWeaponAbilityData FlareLauncher
	FlareLauncher.custom = true
	FlareLauncher.weaponName = "ta_mortar_titanweapon_flarelauncher"
	FlareLauncher.displayName = "#TA_TITAN_MORTAR_WEAPON_FLARELAUNCHER"
	FlareLauncher.description = "#TA_TITAN_MORTAR_WEAPON_FLARELAUNCHER_DESC"
	FlareLauncher.image = $"ui/temp"
	Mortar.Primary = FlareLauncher

	//	Tactical
	ModdedTitanWeaponAbilityData SmokeStrike
	SmokeStrike.custom = true
	SmokeStrike.weaponName = "ta_mortar_titanweapon_smoke"
	SmokeStrike.displayName = "#TA_TITAN_MORTAR_TACTICAL_SMOKESTRIKE"
	SmokeStrike.description = "#TA_TITAN_MORTAR_TACTICAL_SMOKESTRIKE_DESC"
	SmokeStrike.image = $"ui/temp"
	Mortar.Mid = SmokeStrike

	//	Ordinance
	ModdedTitanWeaponAbilityData RocketSalvo
	RocketSalvo.custom = true
	RocketSalvo.weaponName = "ta_mortar_titanweapon_rockets"
	RocketSalvo.displayName = "#TA_TITAN_MORTAR_ORDINANCE_ROCKETSALVO"
	RocketSalvo.description = "#TA_TITAN_MORTAR_ORDINANCE_ROCKETSALVO_DESC"
	RocketSalvo.image = $"ui/temp"
	Mortar.Right = RocketSalvo

	//	Defensive
	ModdedTitanWeaponAbilityData DomeShield
	DomeShield.custom = true
	DomeShield.weaponName = "ta_mortar_titanability_domeshield"
	DomeShield.displayName = "#TA_TITAN_MORTAR_DEFENSIVE_DOMESHIELD"
	DomeShield.description = "#TA_TITAN_MORTAR_DEFENSIVE_DOMESHIELD_DESC"
	DomeShield.image = $"ui/temp"
	Mortar.Left = DomeShield

	//	Core
	ModdedTitanWeaponAbilityData NuclearStrike
	NuclearStrike.custom = true
	NuclearStrike.weaponName = "ta_mortar_titancore_nuclearstrike"
	NuclearStrike.displayName = "#TA_TITAN_MORTAR_CORE_NUCLEARSTRIKE"
	NuclearStrike.description = "#TA_TITAN_MORTAR_CORE_NUCLEARSTRIKE_DESC"
	NuclearStrike.image = $"ui/temp"
	Mortar.Core = NuclearStrike
	//*/

	CreateModdedTitanSimple(Mortar)

	#endif
}
