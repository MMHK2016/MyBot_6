#cs VARIABLE ====================================================================================================================
; Name ..........: MMHK Global Variables
; Description ...: This file Includes all declared variables, constant, or create an array.
; Syntax ........: Global
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

; SCREEN COORDINATES
Global $aClickAway[2] = [222, 22] ; Click Away
Global $aClanInfoBtn[2] = [100, 60] ; Clan Info Button, Chat Window, Main Screen
Global $aMyClanTab[2] = [360, 80] ; My Clan Tab, Info Window, Main Screen
Global $iColorNew = 0xE73838 ; Color of "New" member status
Global $iNMSearchFromY ; New Member - search from Y
Global $iNMScrollTimes ; New Member - page scroll times
Global $aKickOKBtn[2] = [520, 240] ; Kick OK Btn, My Clan Tab, Info Window, Main Screen

; DELAY TIMES
Global Const $iDelayGTFO1 = 200
Global Const $iDelayGTFO2 = 1000
Global Const $iDelayKick1 = 300

; Close the emulator when attacks not scheduled
Global $bAttackExit = False

; Offline while training
Global $bTrainOffline = False, $bDisconnectedNaturally = False
Global $iTrainOfflineTime = 0, $iMinTime = 2, $iExtraTime = 0 ; minutes

; move the Request CC Troops function to the beginning of the run loop
Global $bReqCCFirst = False

; Donation limit
Global $bDonated = False, $bDonLimit = False, $iDonMaxTimes = 2

#region GTFO
; GTFO
Global $iCurInterval = 1
Global Const $aIntervals[25][3] = [	[5,1,1], _
									[5,1,1], _
									[5,1,2], _
									[5,1,3], _
									[5,2,1], _
									[5,2,2], _
									[5,2,3], _
									[5,3,1], _
									[5,3,2], _
									[5,3,3], _
									[5,3,4], _
									[5,5,0], _
									[15,1,1], _
									[15,1,2], _
									[15,1,3], _
									[15,3,1], _
									[15,3,2], _
									[15,3,3], _
									[15,5,1], _
									[15,5,2], _
									[15,5,3], _
									[15,10,3], _
									[15,10,5], _
									[15,10,10], _
									[15,15,0]]
Global $sIntervals = "-"
For $i = 1 to UBound($aIntervals, 1)-1
	$sIntervals &= "|"
	For $j = 0 to UBound($aIntervals, 2)-1
		$sIntervals &= $aIntervals[$i][$j]
		If Not ($j = 2) Then $sIntervals &= "-"
	Next
Next
Global Const $sIntervalsTip = 	GetTranslated(699,46, "Mins-Mins-Num") & @CRLF & _
								GetTranslated(699,47, "Mins: Minutes - Training Frequency") & @CRLF & _
								GetTranslated(699,48, "Mins: Minutes - Kicking Frequency") & @CRLF & _
								GetTranslated(699,49, "Num: Numbers - Members Kicked")
#endregion

#region SmartZap
; GUI variables
Global $ichkSmartZap = 0
Global $ichkSmartZapDB = 1
Global $ichkSmartZapSaveHeroes = 1
Global $itxtMinDE = 250
Global $bDumbZap = True

; stats
Global $smartZapGain = 0, $numLSpellsUsed = 0
Global $iOldsmartZapGain = 0, $iOldNumLTSpellsUsed = 0

; Array to hold Total Amount of DE available from Drill at each level (1-6)
Global Const $drillLevelHold[6] = [120, 225, 405, 630, 960, 1350]

; Array to hold Amount of DE available to steal from Drills at each level (1-6)
Global Const $drillLevelSteal[6] = [59, 102, 172, 251, 343, 479]
#endregion

#region Check Collectors Outside
; collectors outside filter
Global $ichkDBMeetCollOutside, $iDBMinCollOutsidePercent, $iCollOutsidePercent ; check later if $iCollOutsidePercent obsolete

; constants
Global Const $THEllipseWidth = 200, $THEllipseHeigth = 150, $CollectorsEllipseWidth = 130, $CollectorsEllipseHeigth = 97.5
Global Const $centerX = 430, $centerY = 335 ; check later if $THEllipseWidth, $THEllipseHeigth obsolete

Global $hBitmapFirst
#endregion
