  GNU nano 8.4                                                                  cusor.ps1                                                                           
Add-Type -AssemblyName System.Windows.Forms
while (1) {
    $X = [System.Windows.Forms.Cursor]::Position.X
    $Y = [System.Windows.Forms.Cursor]::Position.Y

    Write-Host -NoNewline "`rX: $X | Y: $Y"
}

