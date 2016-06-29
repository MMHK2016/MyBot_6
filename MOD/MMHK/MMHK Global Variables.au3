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

;; Close the emulator when attacks not scheduled
Global $bAttackExit = False

;; Offline while training
Global $bTrainOffline = False, $bDisconnectedNaturally = False
Global $iTrainOfflineTime = 0, $iMinTime = 2, $iExtraTime = 0 ; minutes

;; move the Request CC Troops function to the beginning of the run loop
Global $bReqCCFirst = False

;; Donation limit
Global $bDonated = False, $bDonLimit = False, $iDonMaxTimes = 2

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
