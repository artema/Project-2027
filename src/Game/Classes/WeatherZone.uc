//=============================================================================
// ������� ������. �������� Ded'�� ��� ���� 2027
// Weather system. Copyright (C) 2005 Smoke39 - bomberman49@hotmail.com
// (Modified by Ded (C) 2005)
//=============================================================================
class WeatherZone extends ZoneInfo
     abstract;

var(Weather) float	PrecipRad;			// ������ �����
var(Weather) float	PrecipFreq;			// �������� (� ��������) ����� �������� ������
var(Weather) byte		PrecipDensity;		// ���-�� ������ �� ���� �����
var(Weather) int		PrecipAmp;			// ��������� ������� �������
var(Weather) bool		bSlanty;			// ��������� �� ������� � ��������������� ������ �������? (�� � ������� %D)
var(Weather) bool		bHasSplash;			// ����� �� �������� ������ �� ����� � �����?
var(Weather) float	WaterImpactSpawnProb;	// ���� ��������� ������ ��� ����� � ����
var(Weather) float	GroundImpactSpawnProb;	// ���� ��������� ������ ��� ����� � �����
								// 0 = �������, 1 = ������

var Class<Actor>	WaterImpactClass; 		// ����� ������� ��� ����� � ����
var Class<Actor>	GroundImpactClass;		// ����� ������� ��� ����� � �����
var Class<WeatherDrop>	PrecipClass;		// ����� �������

var Weather PrecipGen;					// ��� ��������� ������

event ActorEntered(Actor Other)
{
	Super.ActorEntered(Other);

	if (Other.IsA('PlayerPawn'))
	{
		if (PrecipGen == None)
		{
			PrecipGen = Spawn(class'Weather');

			PrecipGen.PrecipRad				= PrecipRad;
			PrecipGen.PrecipFreq				= PrecipFreq;
			PrecipGen.PrecipDensity				= PrecipDensity;
			PrecipGen.PrecipAmp				= PrecipAmp;
			PrecipGen.PrecipClass				= PrecipClass;
			PrecipGen.bSlanty					= bSlanty;
			PrecipGen.bHasSplash				= bHasSplash;

			if (WaterImpactClass != None && WaterImpactSpawnProb > 0)
			{
				PrecipGen.WaterImpactClass		= WaterImpactClass;
				PrecipGen.WaterImpactSpawnProb	= WaterImpactSpawnProb;
			}

			if (GroundImpactClass != None && GroundImpactSpawnProb > 0)
			{
				PrecipGen.GroundImpactClass		= GroundImpactClass;
				PrecipGen.GroundImpactSpawnProb	= GroundImpactSpawnProb;
			}
		}

		PrecipGen.TurnOn(Other);
	}
}

event ActorLeaving(Actor Other)
{
	Super.ActorLeaving(Other);

	if (PrecipGen != None && PrecipGen.Target == Other)
	{
		PrecipGen.TurnOff();
		PrecipGen = None;
	}
}

defaultproperties
{
    bHidden=True
    PrecipRad=650.00
    PrecipFreq=0.01
    PrecipDensity=7
    PrecipAmp=135
    PrecipClass=Class'WeatherDrop'
    bSlanty=false
    bHasSplash=true
    WaterImpactClass=Class'WeatherDropRing'
    GroundImpactClass=Class'WeatherRainSplash'
    WaterImpactSpawnProb=1.00
    GroundImpactSpawnProb=0.6
    Texture=Texture'Game.Icons.RainMaker_Icon'
}
