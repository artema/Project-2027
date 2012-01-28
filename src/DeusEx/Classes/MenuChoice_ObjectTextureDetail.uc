//=============================================================================
// MenuChoice_ObjectTextureDetail
//=============================================================================

class MenuChoice_ObjectTextureDetail extends MenuUIChoiceEnum;

var String englishEnumText[2];

// ----------------------------------------------------------------------
// LoadSetting()
// ----------------------------------------------------------------------

function LoadSetting()
{
	local String detailString;
	local int enumIndex;
	local int detailChoice;

	detailString = player.ConsoleCommand("get " $ configSetting);
	detailChoice = 0;

	for (enumIndex=0; enumIndex<arrayCount(enumText); enumIndex++)
	{
		if (englishEnumText[enumIndex] == detailString)
		{
			detailChoice = enumIndex;
			break;
		}	
	}

	SetValue(detailChoice);
}

// ----------------------------------------------------------------------
// SaveSetting()
// ----------------------------------------------------------------------

function SaveSetting()
{
	player.ConsoleCommand("set " $ configSetting $ " " $ englishEnumText[GetValue()]);
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     englishEnumText(0)="Low"
     englishEnumText(1)="High"
     enumText(0)="������"
     enumText(1)="�������"
     defaultInfoWidth=98
     HelpText="�������� �������� ������� ��������."
     actionText="|&�������� ��������"
     configSetting="ini:Engine.Engine.ViewportManager SkinDetail"
}
