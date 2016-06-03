; #FUNCTION# ====================================================================================================================
; Name ..........: _SleepStatus2
; Description ...: Update status bar with remaining timer
;				   Add Days and Hours elements and rewrite logic to version 1
; Syntax ........: _SleepStatus2($iDelay[, $iSleep = True[, $bDirection = True]])
; Parameters ....: $iDelay              - an integer value.
;                  $iSleep              - [optional] an integer value. Default is True.
;                  $bDirection          - [optional] a boolean value. Default is True.
; Return values .: Boolean represents Run State
; Author ........: MMHK (May-2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......: _SleepStatus
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func _SleepStatus2($iDelay, $iSleep = True, $bDirection = True)
	; $bDirection: True equals count down display, False equals count up display

	Local $iDay, $iHour, $iMin, $iSec
	Local $iBegin, $iCurTime, $iTime
	Local $iDayCalc, $iHourCalc, $iMinCalc, $iSecCalc
	Local $sStatus
	Local Const $Font = "Verdana"
	Local Const $FontSize = 7.5

	_TicksToDay($iDelay, $iDay, $iHour, $iMin, $iSec)

	$iBegin = TimerInit()
	While TimerDiff($iBegin) < $iDelay

		If $RunState = False Then Return True ; dependency

		$iCurTime = TimerDiff($iBegin)
		$iTime = $iCurTime ; display count up timer ; avoid flicker
		If $bDirection = True Then $iTime = $iDelay - $iCurTime ; display countdown timer

		_TicksToDay($iTime, $iDayCalc, $iHourCalc, $iMinCalc, $iSecCalc)

		$sStatus = "Waiting Time= " & StringFormat("%2u Days %02u:%02u:%02u", $iDay, $iHour, $iMin, $iSec) & ",  Time Left= " & StringFormat("%2u Days %02u:%02u:%02u", $iDayCalc, $iHourCalc, $iMinCalc, $iSecCalc)
		_GUICtrlStatusBar_SetText($statLog, " Status: " & $sStatus) ; dependency

		If $iSleep = True Then Sleep(500)
	WEnd
	Return False
EndFunc   ;==>_SleepStatus2