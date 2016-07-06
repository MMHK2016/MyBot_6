#cs FUNCTION ====================================================================================================================
; Name ..........: GTFO
; Description ...: Kick new members when they donated or their received amount larger than 35 or Kick new members from bottom
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

Func GTFO()
	If $ichkBotStop = 0 Or $icmbBotCond <> 22 Then Return

	Local $iKicked = 0, $iMaxKick = $aIntervals[$iCurInterval][2], $iTry, $aMember, $iMaxDon = 0, $iMaxRev = 35 ; set gui later
	SetLog("GTFO Kick Start... ", $COLOR_FUCHSIA)

	While $iKicked < $iMaxKick
		If _Sleep($iDelayGTFO2) Then ExitLoop

		$iTry = 0
		While Not IsClanInfoPage()
			If $iTry > 10 Then
				SetLog("Problem Opening Clan Info Page ... ", $COLOR_PURPLE)
				Return
			EndIf
			OpenClanInfoPage()
			$iTry += 1
			If _Sleep($iDelayGTFO1) Then ExitLoop 2
		WEnd

		FindNewMember()
		While True
			$aMember = NextNewMember()
			If _Sleep($iDelayGTFO1) Then ExitLoop
			If IsArray($aMember) Then
				If $aMember[6] > $iMaxDon Or $aMember[7] > $iMaxRev Then
					if KickMember($aMember) Then
						$iKicked += 1
						ExitLoop
					EndIf
				EndIf
			Else
				FindNewMember()
				$aMember = NextNewMember(False)
				If _Sleep($iDelayGTFO1) Then ExitLoop
				If IsArray($aMember) Then
					If KickMember($aMember) Then
						$iKicked += 1
						ExitLoop
					EndIf
				Else
					SetLog("No new members to kick", $COLOR_FUCHSIA)
					ExitLoop 2
				EndIf
			EndIf
		WEnd
	WEnd
	SetLog("GTFO Kick Stop... ", $COLOR_FUCHSIA)
EndFunc

Func OpenClanInfoPage($bFromChat = True) ; from chat window or from clan info icon
	ClickP($aClickAway, 1, 0, "#0932")
	If _Sleep($iDelayGTFO1) Then Return

	If $bFromChat Then
		If IsMainPage() Then
			ClickP($aOpenChat, 1, 0, "#0468")
			If _Sleep($iDelayGTFO1) Then Return
		EndIf
		If IsMainChatOpenPage() Then
			ClickP($aClanTab, 1, 0, "#0169")
			If _Sleep($iDelayGTFO1) Then Return
			ClickP($aClanInfoBtn, 1, 0, "#0470")
			If _Sleep($iDelayGTFO1) Then Return
		EndIf
	Else
		If IsMainChatOpenPage() Then
			ClickP($aCloseChat, 1, 0, "#0173")
			If _Sleep($iDelayGTFO1) Then Return
		EndIf
		If IsMainPage() Then
			ClickP($aClanInfo, 1, 0, "#0470")
			If _Sleep($iDelayGTFO1) Then Return
			ClickP($aMyClanTab)
			If _Sleep($iDelayGTFO1) Then Return
		EndIf
	EndIf
EndFunc

Func FindNewMember()
	$iNMSearchFromY = 130
	$iNMScrollTimes = 0
EndFunc

Func NextNewMember($bPageDown = True)
	Local $aNewPixel, $aNewMember[9]

	While True
		If _Sleep($iDelayGTFO1) Then Return

		ForceCaptureRegion()
		$aNewPixel = _PixelSearch(200, $iNMSearchFromY, 202, 630, Hex($iColorNew, 6), 20)
		If IsArray($aNewPixel) Then
			$aNewMember[0] = $aNewPixel[0]
			$aNewMember[1] = $aNewPixel[1]
			$aNewMember[2] = getOcrMemberNumber($aNewPixel[0]-180, $aNewPixel[1]-18)
			$aNewMember[5] = "New"
			$aNewMember[6] = getOcrMemberDonRev($aNewPixel[0]+280, $aNewPixel[1]-10)
			$aNewMember[7] = getOcrMemberDonRev($aNewPixel[0]+400, $aNewPixel[1]-10)
			$iNMSearchFromY = $aNewPixel[1] + 42
			If $aNewMember[2] = "" Or $aNewMember[6] = "" Or $aNewMember[7] = "" Then ContinueLoop
			Return $aNewMember
		Else
			If $iNMScrollTimes > 3 Then Return 0
			If $bPageDown Then
				ClickDrag(400, 650, 400, 650-10*52, 1000)
			Else
				ClickDrag(400, 650-10*52, 400, 650, 1000)
			EndIf
			$iNMScrollTimes += 1
			$iNMSearchFromY = 130
		EndIf
	WEnd
EndFunc

Func KickMember($aOneMember)
	Local $iKickBtnPosX, $iKickBtnPosY
	If _Sleep($iDelayKick1) Then Return

	ClickP($aOneMember)
	If _Sleep($iDelayKick1) Then Return

	$iKickBtnPosX = $aOneMember[0] + 300
	If $aOneMember[1] > 615 Then
		$iKickBtnPosY = 700
	Else
		$iKickBtnPosY = $aOneMember[1] + 70
	EndIf

	Click($iKickBtnPosX, $iKickBtnPosY)
	If _Sleep($iDelayKick1) Then Return

	ClickP($aKickOKBtn)
	If _Sleep($iDelayKick1) Then Return

	SetLog("Kicked: #" & $aOneMember[2] & " - Donated: " & $aOneMember[6] & ", Received: " & $aOneMember[7], $COLOR_FUCHSIA)
	Return True
EndFunc
