#cs SNIPPET ====================================================================================================================
; Name ..........: MMHK applyConfig
; Description ...: Applies all of the variable to the GUI
; Syntax ........: applyConfig()
; Parameters ....: $bRedrawAtExit = True, redraws bot window after config was applied
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
If ($bAttackExit) Then
	GUICtrlSetState($chkAttackExit, $GUI_CHECKED)
Else
	GUICtrlSetState($chkAttackExit, $GUI_UNCHECKED)
EndIf

; Offline while training
If ($bTrainOffline) Then
	GUICtrlSetState($chkTrainOffline, $GUI_CHECKED)
	GUICtrlSetState($txtMinTime, $GUI_ENABLE)
	GUICtrlSetState($chkDisconnectedNaturally, $GUI_ENABLE)
	GUICtrlSetState($txtExtraTime, $GUI_ENABLE)
Else
	GUICtrlSetState($chkTrainOffline, $GUI_UNCHECKED)
	GUICtrlSetState($txtMinTime, $GUI_DISABLE)
	GUICtrlSetState($chkDisconnectedNaturally, $GUI_DISABLE)
	GUICtrlSetState($txtExtraTime, $GUI_DISABLE)
EndIf

GUICtrlSetData($txtMinTime, $iMinTime)

If ($bDisconnectedNaturally) Then
	GUICtrlSetState($chkDisconnectedNaturally, $GUI_CHECKED)
Else
	GUICtrlSetState($chkDisconnectedNaturally, $GUI_UNCHECKED)
EndIf

GUICtrlSetData($txtExtraTime, $iExtraTime)

; Smart Zap
If $ichkSmartZap = 1 Then
	GUICtrlSetState($chkSmartLightSpell, $GUI_CHECKED)
	GUICtrlSetState($chkSmartZapDB, $GUI_ENABLE)
	GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_ENABLE)
	GUICtrlSetState($txtMinDark, $GUI_ENABLE)
	GUICtrlSetState($lblSmartZap, $GUI_ENABLE)
Else
	GUICtrlSetState($chkSmartLightSpell, $GUI_UNCHECKED)
	GUICtrlSetState($chkSmartZapDB, $GUI_DISABLE)
	GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_DISABLE)
	GUICtrlSetState($txtMinDark, $GUI_DISABLE)
	GUICtrlSetState($lblSmartZap, $GUI_DISABLE)
EndIf

If $ichkSmartZapDB = 1 Then
	GUICtrlSetState($chkSmartZapDB, $GUI_CHECKED)
Else
	GUICtrlSetState($chkSmartZapDB, $GUI_UNCHECKED)
EndIf

If $ichkSmartZapSaveHeroes = 1 Then
	GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_CHECKED)
Else
	GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_UNCHECKED)
EndIf

GUICtrlSetData($txtMinDark, $itxtMinDE)

; Move the Request CC Troops function to the beginning of the run loop
If ($bReqCCFirst) Then
	GUICtrlSetState($chkReqCCFirst, $GUI_CHECKED)
Else
	GUICtrlSetState($chkReqCCFirst, $GUI_UNCHECKED)
EndIf

; Check Collectors Outside
If $ichkDBMeetCollOutside = 1 Then
	GUICtrlSetState($chkDBMeetCollOutside, $GUI_CHECKED)
Else
	GUICtrlSetState($chkDBMeetCollOutside, $GUI_UNCHECKED)
EndIf
chkDBMeetCollOutside()

GUICtrlSetData($txtDBMinCollOutsidePercent, $iDBMinCollOutsidePercent)

; Donation limit
If ($bDonLimit) Then
	GUICtrlSetState($chkDonLimit, $GUI_CHECKED)
	GUICtrlSetState($txtDonMaxTimes, $GUI_ENABLE)
Else
	GUICtrlSetState($chkDonLimit, $GUI_UNCHECKED)
	GUICtrlSetState($txtDonMaxTimes, $GUI_DISABLE)
EndIf

GUICtrlSetData($txtDonMaxTimes, $iDonMaxTimes)

