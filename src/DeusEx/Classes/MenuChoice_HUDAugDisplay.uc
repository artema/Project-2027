//=============================================================================
// MenuChoice_HUDAugDisplay
//=============================================================================

class MenuChoice_HUDAugDisplay extends MenuUIChoiceEnum;

// ----------------------------------------------------------------------
// LoadSetting()
// ----------------------------------------------------------------------

function LoadSetting()
{
	SetValue(int(player.bHUDShowAllAugs));
}

// ----------------------------------------------------------------------
// SaveSetting()
// ----------------------------------------------------------------------

function SaveSetting()
{
	player.bHUDShowAllAugs = bool(GetValue());
	player.AugmentationSystem.RefreshAugDisplay();
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
     defaultValue=1
     defaultInfoWidth=88
helpText="��� ��������� ���������� ����� ���������� ������������ � HUD."
actionText="HUD ����� ����������"
enumText(0)="��������"
enumText(1)="���"
}
