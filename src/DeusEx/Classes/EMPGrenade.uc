//=============================================================================
// EMPGrenade.
//=============================================================================
class EMPGrenade extends GrenadeProjectile;

simulated function DrawExplosionEffects(vector HitLocation, vector HitNormal)
{
	local ExplosionLight light;
	local int i;
	local Rotator rot;
	local SphereEffect sphere;
   local ExplosionSmall expeffect;

	// draw a pretty explosion
	light = Spawn(class'ExplosionLight',,, HitLocation);
	if (light != None)
	{
      if (!bDamaged)
         light.RemoteRole = ROLE_None;
		light.size = 8;
		light.LightHue = 128;
		light.LightSaturation = 96;
		light.LightEffect = LE_Shell;
	}

	expeffect = Spawn(class'ExplosionSmall',,, HitLocation);
   if ((expeffect != None) && (!bDamaged))
      expeffect.RemoteRole = ROLE_None;

	// draw a cool light sphere
	sphere = Spawn(class'SphereEffect',,, HitLocation);
	if (sphere != None)
   {
      if (!bDamaged)
         sphere.RemoteRole = ROLE_None;
		sphere.size = blastRadius / 32.0;
   }
}

defaultproperties
{
     AISoundLevel=0.100000
     bBlood=False
     bDebris=False
     DamageType=EMP
     spawnWeaponClass=Class'DeusEx.WeaponEMPGrenade'
     ItemName="Electromagnetic Pulse (EMP) Grenade"
     speed=1000.000000
     MaxSpeed=1000.000000
     Damage=100.000000
     MomentumTransfer=50000
     ImpactSound=Sound'DeusExSounds.Weapons.EMPGrenadeExplode'
     LifeSpan=0.000000
     Mesh=LodMesh'DeusExItems.EMPGrenadePickup'
     CollisionRadius=3.000000
     CollisionHeight=1.900000
     Mass=5.000000
     Buoyancy=2.000000
}