//=============================================================================
// MenuChoice_RenderDevice
//=============================================================================

class MenuChoice_RenderDevice extends MenuUIChoiceAction;

var localized String PromptTitle;
var localized String GamePromptMessage;
var localized String RestartPromptMessage;

// ----------------------------------------------------------------------
// ButtonActivated()
// ----------------------------------------------------------------------

function bool ButtonActivated( Window buttonPressed )
{
	local DeusExLevelInfo info;
	local DeusExRootWindow root;

	root = DeusExRootWindow(GetRootWindow());

	info = player.GetLevelInfo();

	// If the game is running, first *PROMPT* the user, becauase
	// this will cause the game to quit and restart!!

	if (((info != None) && (info.MissionNumber >= 0)) &&
	   !((player.IsInState('Dying')) || (player.IsInState('Paralyzed'))))
	{
		root.MessageBox(PromptTitle, GamePromptMessage, 0, False, Self);
	}
	else
	{
		root.MessageBox(PromptTitle, RestartPromptMessage, 0, False, Self);
	}

	return True;
}

// ----------------------------------------------------------------------
// BoxOptionSelected()
// ----------------------------------------------------------------------

event bool BoxOptionSelected(Window button, int buttonNumber)
{
	local DeusExRootWindow root;

	root = DeusExRootWindow(GetRootWindow());

	// Destroy the msgbox!  
	root.PopWindow();

	if (buttonNumber == 0) 
	{
		// First save any other changes the user made 
		// while in this menu before restarting the game!
		SaveMenuSettings();

		// Restart
		player.ConsoleCommand("RELAUNCH -changevideo");
	}
	return true;
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
PromptTitle="������������� 2027?"
GamePromptMessage="��� ������ ������������ ���� ������������� 2027, ��� ���� ������� ���� ����������, ���� �� �� �����������. �������������?"
RestartPromptMessage="��� ������ ������������ ���� ������������� 2027. ������� ����������?"
helpText="�������� ���������� ��� 3D ����������.  ��� ����� ����� �������� 2027 � ������� 3D ����������."
actionText="|&���������� ��� ����������..."
     Action=MA_Custom
}
