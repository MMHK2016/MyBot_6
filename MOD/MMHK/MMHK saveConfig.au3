#cs SNIPPET ====================================================================================================================
; Name ..........: MMHK saveConfig
; Description ...: Saves all of the GUI values to the config.ini and building.ini files
; Syntax ........: saveConfig()
; Parameters ....: None
; Return values .: None
; Author ........: MMHK (June-2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: None
#ce ===============================================================================================================================

; Close the emulator when attacks not scheduled
If GUICtrlRead($chkAttackExit) = $GUI_CHECKED Then
	IniWriteS($config, "planned", "AttackExit", 1)
Else
	IniWriteS($config, "planned", "AttackExit", 0)
EndIf

; Offline while training
If GUICtrlRead($chkTrainOffline) = $GUI_CHECKED Then
	IniWriteS($config, "troop", "TrainOffline", 1)
Else
	IniWriteS($config, "troop", "TrainOffline", 0)
EndIf

IniWriteS($config, "troop", "MinTime", GUICtrlRead($txtMinTime))

If GUICtrlRead($chkDisconnectedNaturally) = $GUI_CHECKED Then
	IniWriteS($config, "troop", "DisconnectedNaturally", 1)
Else
	IniWriteS($config, "troop", "DisconnectedNaturally", 0)
EndIf

IniWriteS($config, "troop", "ExtraTime", GUICtrlRead($txtExtraTime))

; Smart Zap
If GUICtrlRead($chkSmartLightSpell) = $GUI_CHECKED Then
	IniWriteS($config, "attack", "UseSmartZap", 1)
Else
	IniWriteS($config, "attack", "UseSmartZap", 0)
EndIf

If GUICtrlRead($chkSmartZapDB) = $GUI_CHECKED Then
	IniWriteS($config, "attack", "ZapDBOnly", 1)
Else
	IniWriteS($config, "attack", "ZapDBOnly", 0)
EndIf

If GUICtrlRead($chkSmartZapSaveHeroes) = $GUI_CHECKED Then
	IniWriteS($config, "attack", "THSnipeSaveHeroes", 1)
Else
	IniWriteS($config, "attack", "THSnipeSaveHeroes", 0)
EndIf

IniWriteS($config, "attack", "MinDE", GUICtrlRead($txtMinDark))

; Move the Request CC Troops function to the beginning of the run loop
If GUICtrlRead($chkReqCCFirst) = $GUI_CHECKED Then
	IniWriteS($config, "planned", "ReqCCFirst", 1)
Else
	IniWriteS($config, "planned", "ReqCCFirst", 0)
EndIf

; Check Collectors Outside
If GUICtrlRead($chkDBMeetCollOutside) = $GUI_CHECKED Then
	IniWriteS($config, "search", "DBMeetCollOutside", 1)
Else
	IniWriteS($config, "search", "DBMeetCollOutside", 0)
EndIf

IniWriteS($config, "search", "DBMinCollOutsidePercent", GUICtrlRead($txtDBMinCollOutsidePercent))

; Donation limit
If GUICtrlRead($chkDonLimit) = $GUI_CHECKED Then
	IniWriteS($config, "donate", "DonLimit", 1)
Else
	IniWriteS($config, "donate", "DonLimit", 0)
EndIf

IniWriteS($config, "donate", "DonMaxTimes", GUICtrlRead($txtDonMaxTimes))
