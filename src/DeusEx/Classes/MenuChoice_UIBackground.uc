//=============================================================================
// MenuChoice_UIBackground
//=============================================================================

class MenuChoice_UIBackground extends MenuUIChoiceEnum;

// ----------------------------------------------------------------------
// LoadSetting()
// ----------------------------------------------------------------------

function LoadSetting()
{
	SetValue(player.UIBackground);
}

// ----------------------------------------------------------------------
// SaveSetting()
// ----------------------------------------------------------------------

function SaveSetting()
{
	player.UIBackground = GetValue();

	if (player.UIBackground == 1)
		DeusExRootWindow(player.rootWindow).Hide();

	DeusExRootWindow(player.rootWindow).ShowSnapshot();

	if (player.UIBackground == 1)
		DeusExRootWindow(player.rootWindow).Show();
}

// ----------------------------------------------------------------------
// ResetToDefault()
// ----------------------------------------------------------------------

function ResetToDefault()
{
	SetValue(defaultValue);
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     helpText="����������, ��� ����� ������������ ��� ���� � 2D ��������: 3D-���������, ��������� �������� ��� �� ������ �����."
     actionText="|&��� UI/����"
     enumText(0)="3D-������"
     enumText(1)="������"
     enumText(2)="������"
     defaultInfoWidth=97
}
