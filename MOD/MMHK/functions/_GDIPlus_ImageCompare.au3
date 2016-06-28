#cs FUNCTION ====================================================================================================================
; Name ..........: _GDIPlus_ImageCompare
; Description ...: Compare two images by GDI+ image handles
; Syntax ........: _GDIPlus_ImageCompare($hImage1, $hImage2[, $bFastCmp = True])
; Parameters ....: $hImage1, $hImage2	GDI+ image handles
;                  $bFastCmp          	[optional] a boolean value. Default is True.
; Return values .: Success: 			an array contains time escaped, width, height, diff pixels and location
;				   Failure: 			0
;				   @error:				1 - width error, 2 - height error
; Author ........: MMHK (June-2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: None
#ce ===============================================================================================================================
Func _GDIPlus_ImageCompare($hImage1, $hImage2, $bFastCmp = True)

    Local Const $iW = _GDIPlus_ImageGetWidth($hImage1), $iH = _GDIPlus_ImageGetHeight($hImage1)

    If ($iW <> _GDIPlus_ImageGetWidth($hImage2)) Then Return SetError(1, 0, 0)
	If ($iH <> _GDIPlus_ImageGetHeight($hImage2)) Then Return SetError(2, 0, 0)

    Local $t = TimerInit()
    Local $tBitmapData1 = _GDIPlus_BitmapLockBits($hImage1, 0, 0, $iW, $iH, $GDIP_ILMREAD, $GDIP_PXF32ARGB)
    Local $tBitmapData2 = _GDIPlus_BitmapLockBits($hImage2, 0, 0, $iW, $iH, $GDIP_ILMREAD, $GDIP_PXF32ARGB)

    Local $iScan1 = DllStructGetData($tBitmapData1, "Scan0")
    Local $tPixel1 = DllStructCreate("int[" & $iW * $iH & "];", $iScan1)
    Local $iStride = Abs(DllStructGetData($tBitmapData1, "Stride"))

    Local $iScan2 = DllStructGetData($tBitmapData2, "Scan0")
    Local $tPixel2 = DllStructCreate("int[" & $iW * $iH & "];", $iScan2)

    If $bFastCmp Then
        $iResult = DllCall("msvcrt.dll", "int:cdecl", "memcmp", "ptr", $iScan1, "ptr", $iScan2, "int", ($iH - 1) * $iStride + ($iW - 1) * 4)[0]
    Else
        Local $iX, $iY, $iRowOffset, $iPixel1, $iPixel2, $aDiff[$iW * $iH + 1][3], $c = 1
        For $iY = 0 To $iH - 1
            $iRowOffset = $iY * $iW + 1
            For $iX = 0 To $iW - 1
                $iPixel1 = DllStructGetData($tPixel1, 1, $iRowOffset + $iX)
                $iPixel2 = DllStructGetData($tPixel2, 1, $iRowOffset + $iX)
                If $iPixel1 <> $iPixel2 Then
                    $aDiff[$c][0] = $iX & ", " & $iY
                    $aDiff[$c][1] = "0x" & Hex($iPixel1, 8)
                    $aDiff[$c][2] = "0x" & Hex($iPixel2, 8)
                    $c += 1
                EndIf
            Next
        Next
        $aDiff[0][0] = TimerDiff($t)
        $aDiff[0][1] = $iW
        $aDiff[0][2] = $iH
    EndIf

    _GDIPlus_BitmapUnlockBits($hImage1, $tBitmapData1)
    _GDIPlus_BitmapUnlockBits($hImage2, $tBitmapData2)

    If $bFastCmp Then Return SetError(0, Int(TimerDiff($t)), $iResult = 0)

    ReDim $aDiff[$c][3]
    Return $aDiff

EndFunc   ;==>_GDIPlus_ImageCompare
