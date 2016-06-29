#cs SNIPPET ====================================================================================================================
; Name ..........: MMHK readConfig
; Description ...: Reads config file and sets variables
; Syntax ........: readConfig()
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
If IniRead($config, "planned", "AttackExit", "0") = 1 Then
	$bAttackExit = True
Else
	$bAttackExit = False
EndIf

; Offline while training
If IniRead($config, "troop", "TrainOffline", "0") = 1 Then
	$bTrainOffline = True
Else
	$bTrainOffline = False
EndIf

$iMinTime = IniRead($config, "troop", "MinTime", "2")

If IniRead($config, "troop", "DisconnectedNaturally", "0") = 1 Then
	$bDisconnectedNaturally = True
Else
	$bDisconnectedNaturally = False
EndIf

$iExtraTime = IniRead($config, "troop", "ExtraTime", "0")

; Smart Zap
$ichkSmartZap = Number(IniRead($config, "attack", "UseSmartZap", "0"))
$ichkSmartZapDB = Number(IniRead($config, "attack", "ZapDBOnly", "1"))
$ichkSmartZapSaveHeroes = Number(IniRead($config, "attack", "THSnipeSaveHeroes", "1"))
$itxtMinDE = Number(IniRead($config, "attack", "MinDE", "250"))

If IniRead($config, "attack", "DumbZap", "1") = 1 Then
	$bDumbZap = True
Else
	$bDumbZap = False
EndIf

; Move the Request CC Troops function to the beginning of the run loop
If IniRead($config, "planned", "ReqCCFirst", "0") = 1 Then
	$bReqCCFirst = True
Else
	$bReqCCFirst = False
EndIf

; Check Collectors Outside
$ichkDBMeetCollOutside = IniRead($config, "search", "DBMeetCollOutside", "0")
$iDBMinCollOutsidePercent = IniRead($config, "search", "DBMinCollOutsidePercent", "50")

; Donation limit
If IniRead($config, "donate", "DonLimit", "0") = 1 Then
	$bDonLimit = True
Else
	$bDonLimit = False
EndIf

$iDonMaxTimes = IniRead($config, "donate", "DonMaxTimes", "2")
