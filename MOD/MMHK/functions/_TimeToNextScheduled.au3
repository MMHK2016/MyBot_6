; #FUNCTION# ====================================================================================================================
; Name ..........: _TimeToNextScheduled
; Description ...:
; Syntax ........: _TimeToNextScheduled(ByRef $aScheduledWeekDays, ByRef $aScheduledHours)
; Parameters ....: $aScheduledWeekDays	- Week days array
;				   $aScheduledHours		- Hours array
; Return values .: Success: 			time in millisecond
;				   Failure: 			0
; Author ........: MMHK (May-2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......: None
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func _TimeToNextScheduled(ByRef $aScheduledWeekDays, ByRef $aScheduledHours)

	Local $iNowDay = @WDAY-1
	Local $iChkDay = $aScheduledWeekDays[$iNowDay]
	Local $iChkHour = $aScheduledHours[@HOUR]
	Local $iNextChkDay = 0, $iNextChkHour = 0
	Local $iRemainMinutes = 0, $iHoursToNext = 0
	Local $iRemainHours = 0, $iDaysToNext = 0
	Local $iWaitTime = 0

	If _ArrayMax($aScheduledWeekDays,1,0) = 0 Or _  		; week days all unchecked
	   _ArrayMax($aScheduledHours,1,0) = 0 Then  _  		; hours all unchecked
	   Return $iWaitTime

	If $iChkDay = 1 And $iChkHour = 1 Then Return $iWaitTime; today checked, this hour checked

	If $iChkDay = 1 Then 									; today checked, this hour unchecked
		$iNextChkHour = _ArraySearch($aScheduledHours, 1, @HOUR+1)
		If $iNextChkHour > -1 Then 	; more scheduled hours today
			$iRemainMinutes = 60 - @MIN
			$iHoursToNext = $iNextChkHour - @HOUR - 1
 			$iWaitTime = ($iRemainMinutes + $iHoursToNext * 60) * 60 * 1000
			Return $iWaitTime
		EndIf
	EndIf

	$iRemainMinutes = 60 - @MIN								; today unchecked, this hour checked or unchecked
	$iRemainHours = 24 - @HOUR - 1
	$iNextChkDay = _ArraySearch($aScheduledWeekDays, 1, $iNowDay+1)
	If $iNextChkDay > -1 Then 	; more scheduled days this week
		$iDaysToNext = $iNextChkDay - $iNowDay - 1
	Else						; none this week, more scheduled days next week
		$iNextChkDay = _ArraySearch($aScheduledWeekDays, 1, 0, $iNowDay)
		$iDaysToNext =  UBound($aScheduledWeekDays) - ($iNowDay - $iNextChkDay) - 1
	EndIf
	$iNextChkHour = _ArraySearch($aScheduledHours, 1, 0)
	$iHoursToNext = $iNextChkHour
	$iWaitTime = ($iRemainMinutes + $iRemainHours * 60 + $iDaysToNext * 24 * 60 + $iHoursToNext * 60) * 60 * 1000
	Return $iWaitTime

EndFunc   ;==>_TimeToNextScheduled
