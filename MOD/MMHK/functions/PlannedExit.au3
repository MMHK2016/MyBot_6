#cs FUNCTION ====================================================================================================================
; Name ..........: PlannedExit
; Description ...: Close the emulator when attacks not scheduled
; Syntax ........: None
; Parameters ....: None
; Return values .: Success: 			True
;				   Failure: 			False
;				   @error:
; Author ........: MMHK (May-2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: None
#ce ===============================================================================================================================

Func PlannedExit()

	If Not ($bAttackExit) Then Return False 	; exit unchecked

	Local $iTimeToNext = _TimeToNextScheduled($iPlannedAttackWeekDays,$iPlannedattackHours) + Random(0, 15, 1) * 60 * 1000

	If $iTimeToNext = 0 Then Return False 		; all unchecked of day or hour; all checked current day and hour

	Local $iDay, $iHour, $iMin, $iSec
	_TicksToDay($iTimeToNext, $iDay, $iHour, $iMin, $iSec)

	$sSleepTime = StringFormat("%2u Days %02u:%02u:%02u", $iDay, $iHour, $iMin, $iSec)
	SetLog("Close Emulater as planned for ... " & $sSleepTime & " ...", $COLOR_FUCHSIA)
	If _Sleep($iDelayRunBot1) Then Return False

	CloseCOC()
	If _Sleep($iDelayRunBot1) Then Return False

	WinGetAndroidHandle()
	If @error <> 0 Then Return SetError(0, 0, 0)

	Local $bEmulatorMinimized
	If BitAND(WinGetState($HWnD) ,16) then
		$bEmulatorMinimized = True
	Else
		$bEmulatorMinimized = False
	EndIf

	CloseAndroid()
	If _SleepStatus2($iTimeToNext) Then Return True

	OpenAndroid(True)
	If _Sleep($iDelayRunBot1) Then Return False

	WinGetAndroidHandle()
	If @error <> 0 Then Return SetError(0, 0, 0)

	If $bEmulatorMinimized And Not (BitAND(WinGetState($HWnD) ,16)) then
		WinSetState($HWnD, "", @SW_MINIMIZE)
		SetLog("Minimize Emulater ... ", $COLOR_FUCHSIA)
	EndIf

	Return True

EndFunc   ;==>PlannedExit
