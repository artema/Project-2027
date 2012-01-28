//=============================================================================
// ������� ������. �������� Ded'�� ��� ���� 2027
// Weather system. Copyright (C) 2005 Smoke39 - bomberman49@hotmail.com
// (Modified by Ded (C) 2005)
//=============================================================================
class Weather extends ParticleGenerator;

var Class<WeatherDrop>				PrecipClass;		// ����� �������
var Class<Actor>					WaterImpactClass; 	// ����� ������� ��� ����� � ����
var Class<Actor>					GroundImpactClass;	// ����� ������� ��� ����� � �����
var() float						PrecipRad;			// ������ �����
var() float						PrecipFreq;			// �������� (� ��������) ����� �������� ������
var() byte						PrecipDensity;		// ���-�� ������ �� ���� �����
var() int						PrecipAmp;			// ��������� ������� �������
var() bool						bSlanty;			// ��������� �� ������� � ��������������� ������ �������? (�� � ������� %D)
var() bool						bHasSplash;			// ����� �� �������� ������ �� ����� � �����?
var() float						WaterImpactSpawnProb;	// ���� ��������� ������ ��� ����� � ����
var() float						GroundImpactSpawnProb;	// ���� ��������� ������ ��� ����� � �����
											// 0 = �������, 1 = ������

var Actor Target;
var bool bOn;
var float Height;

function TurnOn(Actor newTarget)
{
	Height = 300;
	Target = newTarget;
	SetProxyData();
	SetTimer(PrecipFreq, false);
	bOn = true;
}

function TurnOff()
{
	LifeSpan = PrecipClass.Default.LifeSpan;
	bOn = false;
}

function Timer()
{
	if (!bOn)
		return;

	Precipitate(PrecipDensity);
	SetTimer(PrecipFreq, false);
}

function vector RandomSpawn()
{
	return Target.Location + Target.Velocity/2 + PrecipRad/4*vector(Target.Rotation) + Height*vect(0,0,1)
		+ (FRand()-0.5)*PrecipRad * vect(2,0,0)
		+ (FRand()-0.5)*PrecipRad * vect(0,2,0)
		+ (FRand()-0.5)*150 * vect(0,0,1);
}

function Precipitate(int density)
{
	local int i;
	local DeusExPlayer Player;
	
	Player = DeusExPlayer(GetPlayerPawn());
	
	if(Player.bWeatherEnabled)
	{
		for (i=0; i<density; i++)
			 Spawn(PrecipClass, self,, RandomSpawn());
	}
}

function bool Recycle(Actor particle)
{
	local int i;

	if ( !bOn )
		return false;

	TimerRate += PrecipFreq / PrecipDensity;
	for (i=0; i<5; i++)
	{
		if (particle.SetLocation(RandomSpawn()))
			return true;
	}

	return false;
}

function RecycleFailed()
{
	if (bOn)
		Precipitate(1);
}

simulated function Tick(float dt)
{
	local vector vel;
	local float speed;
	local rotator r;
	local Actor p;

	if (bHasSplash && ParticleIterator(RenderInterface) != None)
		ParticleIterator(RenderInterface).Update( dt );

	if (bSlanty)
	{
		vel = Target.Velocity;
		vel.Z = 0;
		speed = VSize(vel) / 300;
		if (speed >= 1)
			r = rotator(-vel) - rot(16384,0,0) / speed;
		else
			r = rot(-16384,0,0);

		foreach AllActors(PrecipClass, p)
			p.SetRotation(r);
	}

	if (Height < 600)
		Height = FMin(Height + dt*300, 600);
}

function PostBeginPlay()
{
	local Actor A;

	Super(Effects).PostBeginPlay();

	if (proxy == None)
	{
		proxy = Spawn(class'ParticleProxy');
		if (!bHasSplash)
			proxy.bHidden = true;
	}
}

//������������ � �����
function Impact(vector SplashLoc)
{
	local int i;

	if (!bHasSplash)
		return;

	//if (ParticleIterator(RenderInterface) == None)
	//	return;

	if (GroundImpactSpawnProb > 0)
	{
		if (GroundImpactSpawnProb < 1)
		{
			if (FRand() > GroundImpactSpawnProb)
				return;
		}

		Spawn(GroundImpactClass,,, SplashLoc);
	}
}

//������������ � �����
function WaterImpact(vector SplashLoc)
{
	if (bHasSplash)
	{
		Impact(SplashLoc);
	}
	
	if (WaterImpactSpawnProb > 0)
	{
		if (WaterImpactSpawnProb < 1)
		{
			if (FRand() > WaterImpactSpawnProb)
				return;
		}
		Spawn(WaterImpactClass,,, SplashLoc);
	}
}


defaultproperties
{
	bHidden=True
	DrawType=0
}
