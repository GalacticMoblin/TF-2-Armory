untyped

//		Function declarations
global function TArmory_Init_MortarTone_Rockets

global function OnWeaponAttemptOffhandSwitch_MortarTone_Rockets
global function OnWeaponPrimaryAttack_MortarTone_Rockets
#if SERVER
global function OnWeaponNpcPrimaryAttack_MortarTone_Rockets
#endif

global function OnProjectileCollision_MortarTone_Rockets

//		Data
//	Consts
const float SALVO_INACCURACY = 0.35
const float SALVO_MAX_SPREAD = 400.0

const float SALVO_DELAY = 1.0 //1.0

#if CLIENT
struct
{
	float lastFireFailedTime = 0.0
	float fireFailedDebounceTime = 0.25
} file
#endif


//			Functions
//		Init
void function TArmory_Init_MortarTone_Rockets() {
	#if SERVER
	//	Weapon precache
	PrecacheWeapon( "ta_mortar_titanweapon_rockets" )

	//	Add eDamageSourceId using Dinorush's server code
	table<string, string> customDamageSourceIds = {
		ta_mortar_titanweapon_rockets = "Rocket Salvo",
	}
	RegisterWeaponDamageSources( customDamageSourceIds )
	#endif
}

//		Utils
bool function OnWeaponAttemptOffhandSwitch_MortarTone_Rockets( entity weapon ) {
	//	Sanity checks
	entity owner = weapon.GetWeaponOwner()
	if( !IsValid(owner) || !IsAlive(owner) )
		return false

	//	Add owner to flareData if they aren't in there already
	if( !(owner in flareData) )
		flareData[owner] <- []

	//	Check flares
	array<entity> flares = flareData[owner]
	bool hasFlares = flares.len() > 0
	if( !hasFlares ) {
		#if CLIENT
		float fireTime = Time()
		if( fireTime - file.lastFireFailedTime > file.fireFailedDebounceTime && !weapon.IsBurstFireInProgress() ) {
			AddPlayerHint( 1.0, 0.25, $"armory/mortar/hud/no_flares", "NO FLARES" )	//	TODO: Localise me
			EmitSoundOnEntity( weapon, "UI_MapPing_Fail" )

			file.lastFireFailedTime = fireTime
		}
		#endif
	}

	return hasFlares
}

//		Fire handling
var function OnWeaponPrimaryAttack_MortarTone_Rockets( entity weapon, WeaponPrimaryAttackParams attackParams ) {
	return FireMortarRockets( weapon, attackParams, true )
}

#if SERVER
var function OnWeaponNpcPrimaryAttack_MortarTone_Rockets( entity weapon, WeaponPrimaryAttackParams attackParams ) {
	return FireMortarRockets( weapon, attackParams, false )
}
#endif

int function FireMortarRockets( entity weapon, WeaponPrimaryAttackParams attackParams, bool playerFired ) {
	entity owner = weapon.GetWeaponOwner()
	if( !IsValid(owner) || !IsAlive(owner) )
		return 0

	#if SERVER
	//	Add owner to flareData if they aren't in there already
	if( !(owner in flareData) )
		flareData[owner] <- []

	//	Check flares
	array<entity> flares = flareData[owner]
	if( flares.len() == 0 )
		return 0

	foreach( flare in flares ) {
		//	Check if owner is alive
		if( !IsAlive(owner) )
			return 0

		//	Check if flare is valid
		if( !IsValid(flare) )
			continue

		//	Get fire params
		vector playerPos = attackParams.pos
		vector targetPos = flare.GetOrigin()

		//	Apply inaccuracy
		vector up = Vector(0.0, 0.0, 1.0)
		vector spreadVec = ApplyVectorSpread( up, SALVO_INACCURACY * 180 )
		vector spreadXY = Vector(spreadVec.x, spreadVec.y, 0.0) * SALVO_MAX_SPREAD

		targetPos += spreadXY

		//	Get traj info
		vector dir = CalculateFireVecs( attackParams.pos, targetPos, 3.0, 750.0 )
		float speed = Length(dir)
		dir = Normalize(dir)

		//	Fire rocket
		float fuse = -0.1
		int damageFlags = weapon.GetWeaponDamageFlags()

		entity rocket = weapon.FireWeaponBolt( attackParams.pos, dir,
			speed, damageFlags, damageFlags, playerFired, 0 )
		if( rocket ) {
			//	Table init
			rocket.s.fuse <- fuse
			rocket.s.phase <- true

			//	Grenade init
			rocket.SetProjectileLifetime( SALVO_DELAY )
			rocket.kv.gravity = 0.0
		}

		//	Teleport projectile
		vector endNormal = Vector(-dir.x, -dir.y, dir.z)
		thread TeleportProjectile( rocket, weapon, targetPos, endNormal, SALVO_DELAY )

		//	Remove flares
		if( weapon.GetBurstFireShotsPending() == 1 ) {
			flareData[owner].fastremovebyvalue(flare)
			if( IsValid(flare) )
				flare.Destroy()
		}
	}
	#endif

	//	Player handling
	if( playerFired )
		PlayerUsedOffhand( owner, weapon )

	//	Return
	return weapon.GetWeaponSettingInt( eWeaponVar.ammo_per_shot )
}

//		Collision handling
void function OnProjectileCollision_MortarTone_Rockets( entity proj, vector pos, vector normal, entity hitEnt, int hitbox, bool isCritical ) {
	//	Destroy projectile check
	bool destroy = false
	if( "phase" in proj.s ) {
		destroy = expect bool( proj.s.phase )
	} else { destroy = true }

	if( destroy )
		proj.Destroy()
}