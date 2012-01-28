//=============================================================================
// ������� ������. �������� Ded'�� ��� ���� 2027
// Weather system. Copyright (C) 2005 Smoke39 - bomberman49@hotmail.com
// (Modified by Ded (C) 2005)
//=============================================================================
class WeatherShelter extends ZoneInfo;


var(Weather) bool		bSlanty;			// ��������� �� ������� � ��������������� ������ �������? (�� � ������� %D)

var(Weather) Class<Effects>	WaterImpactClass; 	// ����� ������� ��� ����� � ����
var(Weather) Class<Effects>	GroundImpactClass;	// ����� ������� ��� ����� � �����
var(Weather) float	WaterImpactSpawnProb;	// ���� ��������� ������ ��� ����� � ����
var(Weather) float	GroundImpactSpawnProb;	// ���� ��������� ������ ��� ����� � �����
var(Weather) Class<WeatherDrop>	PrecipClass;		// ����� �������

var(Weather) WeatherNode FirstNode;			// ������ ����� � ����



function BeginPlay()
{
	Super.BeginPlay();

	if ( FirstNode != None )
		FirstNode.Initialize( self );
}

event ActorEntered( Actor Other )
{
	Super.ActorEntered( Other );

	if ( Other.IsA('PlayerPawn') && FirstNode != None && !FirstNode.bOn )
		FirstNode.TurnOn( Other );
}

event ActorLeaving( Actor Other )
{
	Super.ActorLeaving( Other );

	if ( FirstNode != None && FirstNode.Target == Other && FirstNode.bOn )
		FirstNode.TurnOff();
}

defaultproperties
{
    PrecipClass=Class'WeatherDropRain'
    bSlanty=false
    WaterImpactClass=Class'WeatherDropRing'
    GroundImpactClass=Class'WeatherRainSplash'
    WaterImpactSpawnProb=1.00
    GroundImpactSpawnProb=0.6
}
