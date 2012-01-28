//=============================================================================
// MenuChoice_SurroundSound
//=============================================================================

class MenuChoice_SurroundSound extends MenuChoice_OnOff;

// ----------------------------------------------------------------------
// LoadSetting()
// ----------------------------------------------------------------------

function LoadSetting()
{
	LoadSettingBool();
}

// ----------------------------------------------------------------------
// SaveSetting()
// ----------------------------------------------------------------------

function SaveSetting()
{
	SaveSettingBool();
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     defaultValue=1
     defaultInfoWidth=83
helpText="��������� ��������� ����� Dolby Surround.  ��������� Dolby Pro-Logic Surround �������� ���������."
actionText="|&���� Dolby Surround"
     configSetting="ini:Engine.Engine.AudioDevice UseSurround"
}
