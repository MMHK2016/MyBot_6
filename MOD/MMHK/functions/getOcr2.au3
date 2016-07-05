#cs FUNCTION ====================================================================================================================
; Name ..........: OCR
; Description ...: Convert images to strings
; Syntax ........: None
; Parameters ....: None
; Return values .: Success:				None
;				   Failure:				None
;				   @error:				None
; Author ........: MMHK (June-2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: None
#ce ===============================================================================================================================

Func getOcrLabTime($x_start, $y_start) ; -> Get the Time until lab done upgrading
	Return getOcrAndCapture("coc-RemainLaboratory", $x_start, $y_start, 192, 22, True)
EndFunc   ;==>getOcrLabTime

Func getOcrMemberDonRev($x_start, $y_start) ; -> Get member's donate or receive stats
	Return getArmyCampCap($x_start, $y_start)
EndFunc   ;==>getOcrMemberDonRev

Func getOcrMemberNumber($x_start, $y_start) ; -> Get member's number
	Return getTrophyVillageSearch($x_start, $y_start)
EndFunc   ;==>getOcrMemberNumber

Func getOcrSpellsTime($x_start, $y_start) ; -> Get the Time until spells done brewing
	Return getOcrAndCapture("coc-RemainTrain", $x_start, $y_start, 70, 11, True)
EndFunc   ;==>getOcrSpellsTime

Func getOcrTroopsTime($x_start, $y_start) ; -> Get the Time until troops done training
	Return getOcrAndCapture("coc-RemainTrain", $x_start, $y_start, 70, 11, True)
EndFunc   ;==>getOcrTroopsTime

