//=============================================================================
// ����������� ������. �������� Ded'�� ��� ���� 2027
// Memory flusher. Copyright (C) 2003 Ded
//=============================================================================
class Flusher expands actor;

//��� ���� �������.
//��� ������ ��� ������� ������ �������� � ������ ����� ~20 ����� ����. �������� ������� ����...

var() int WaitTime;

simulated function BeginPlay()
{
//	SetTimer(WaitTime,False);
}

simulated function Timer()
{
//        ConsoleCommand("FLUSH");
	log("***2027 - Texture caches flushed***");
        SetTimer(WaitTime,False);
}

defaultproperties
{
     WaitTime=60
     DrawScale=3.000000
     bHidden=True
     Texture=Texture'Engine.S_Counter'
     CollisionRadius=24.000000
     CollisionHeight=24.000000
}
