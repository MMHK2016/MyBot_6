#cs INCLUDE ====================================================================================================================
; Name ..........: MMHK Functions
; Description ...: all MMHK functions included here
; Syntax ........: #include
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

; GENERAL
#include "functions\getOcr2.au3"

; Close the emulator when attacks not scheduled
#include "functions\_SleepStatus2.au3"
#include "functions\_TicksToDay.au3"
#include "functions\_TimeToNextScheduled.au3"
#include "functions\PlannedExit.au3"

; Offline while training
#include "functions\getRemainTrainTime.au3"

; Smart Zap
#include "functions\smartZap.au3"
#include "functions\drillSearch.au3"

; Check Collectors Outside
#include "functions\AreCollectorsOutside.au3"

; Smart donate
#include "functions\_GDIPlus_ImageCompare.au3"

; GTFO
#include "functions\Clan.au3"

; Upgrade Management
#include "functions\UpgradesMgmt.au3"
