
# ============================================================
#   codeOS Gaming - Post instalacion y optimizacion
#   build · learn · run
#   github.com/tu-usuario/codeOS
# ============================================================

#Requires -RunAsAdministrator

$ErrorActionPreference = 'SilentlyContinue'

# Auto-elevacion
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
    Exit
}

# Log
$LogFolder = "C:\codeOS\logs"
If (!(Test-Path $LogFolder)) { New-Item -Path $LogFolder -ItemType Directory -Force | Out-Null }
Start-Transcript -Path "$LogFolder\gaming_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-Step {
    param([string]$Text)
    Write-Host ""
    Write-Host "  >> $Text" -ForegroundColor Cyan
}

function Write-OK {
    param([string]$Text)
    Write-Host "     $Text" -ForegroundColor Green
}

Clear-Host
Write-Host ""
Write-Host "  codeOS Gaming" -ForegroundColor DarkGray
Write-Host "  build · learn · run" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  Aplicando optimizaciones..." -ForegroundColor White
Write-Host ""

# ============================================================
# BLOATWARE
# ============================================================
Write-Step "Eliminando bloatware"

$Bloatware = @(
    "Microsoft.BingNews"
    "Microsoft.BingWeather"
    "Microsoft.BingFinance"
    "Microsoft.BingSports"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.News"
    "Microsoft.Office.Lens"
    "Microsoft.Office.OneNote"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.Office.Todo.List"
    "Microsoft.Whiteboard"
    "Microsoft.WindowsAlarms"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.MixedReality.Portal"
    "Microsoft.YourPhone"
    "Microsoft.Todos"
    "Microsoft.PowerAutomateDesktop"
    "Microsoft.Teams"
    "*EclipseManager*"
    "*ActiproSoftwareLLC*"
    "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
    "*Duolingo-LearnLanguagesforFree*"
    "*PandoraMediaInc*"
    "*CandyCrush*"
    "*BubbleWitch3Saga*"
    "*Wunderlist*"
    "*Flipboard*"
    "*Twitter*"
    "*Facebook*"
    "*Minecraft*"
    "*Royal Revolt*"
    "*Dolby*"
    "*Disney*"
    "*TikTok*"
    "*Netflix*"
    "*Amazon*"
)

foreach ($App in $Bloatware) {
    Get-AppxPackage -Name $App -AllUsers | Remove-AppxPackage -AllUsers
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $App | Remove-AppxProvisionedPackage -Online
}

Write-OK "Bloatware eliminado"

# ============================================================
# ONEDRIVE
# ============================================================
Write-Step "Desinstalando OneDrive"

taskkill /f /im OneDrive.exe 2>$null
Start-Sleep 2
if (Test-Path "$env:SystemRoot\SysWOW64\OneDriveSetup.exe") {
    & "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" /uninstall
}
if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") {
    & "$env:SystemRoot\System32\OneDriveSetup.exe" /uninstall
}
Remove-Item "$env:UserProfile\OneDrive" -Recurse -Force
Remove-Item "$env:LocalAppData\Microsoft\OneDrive" -Recurse -Force
Remove-Item "$env:ProgramData\Microsoft OneDrive" -Recurse -Force
reg delete "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f 2>$null
reg delete "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f 2>$null

Write-OK "OneDrive desinstalado"

# ============================================================
# SERVICIOS
# ============================================================
Write-Step "Configurando servicios"

$DisableServices = @(
    "DiagTrack"           # Telemetria
    "dmwappushservice"    # WAP Push
    "WMPNetworkSvc"       # Windows Media Player
    "MapsBroker"          # Mapas
    "RetailDemo"          # Demo tienda
    "SysMain"             # Superfetch
    "WSearch"             # Windows Search
    "wuauserv"            # Windows Update
    "BITS"                # Background Transfer
    "XblAuthManager"      # Xbox
    "XblGameSave"         # Xbox
    "XboxNetApiSvc"       # Xbox
    "lfsvc"               # GPS
    "SharedAccess"        # ICS
    "wisvc"               # Windows Insider
)

$ManualServices = @(
    "Spooler"             # Impresora manual
    "BITS"                # Windows Update manual
)

foreach ($svc in $DisableServices) {
    Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
    Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
}

foreach ($svc in $ManualServices) {
    Set-Service -Name $svc -StartupType Manual -ErrorAction SilentlyContinue
}

Set-Service -Name "bthserv" -StartupType Automatic -ErrorAction SilentlyContinue

Write-OK "Servicios configurados"

# ============================================================
# PLAN DE ENERGIA
# ============================================================
Write-Step "Aplicando plan de energia alto rendimiento"

powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg /change standby-timeout-ac 0
powercfg /change hibernate-timeout-ac 0
powercfg /change monitor-timeout-ac 0

Write-OK "Plan de energia configurado"

# ============================================================
# RED TCP/IP
# ============================================================
Write-Step "Optimizando red"

netsh int tcp set global autotuninglevel=normal 2>$null
netsh int tcp set global chimney=disabled 2>$null
netsh int tcp set global rss=enabled 2>$null
netsh int tcp set global netdma=disabled 2>$null
netsh int tcp set global ecncapability=enabled 2>$null
netsh int tcp set global timestamps=disabled 2>$null
netsh int tcp set heuristics disabled 2>$null
netsh int tcp set supplemental internet congestionprovider=ctcp 2>$null

# DNS Cloudflare
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
foreach ($adapter in $adapters) {
    Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses ("1.1.1.1", "1.0.0.1")
}

Write-OK "Red optimizada · DNS Cloudflare 1.1.1.1"

# ============================================================
# REGISTRO - RED
# ============================================================
Write-Step "Aplicando tweaks de registro"

# TCP
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f | Out-Null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d 1 /f | Out-Null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpDelAckTicks" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f | Out-Null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DeadGWDetectDefault" /t REG_DWORD /d 0 /f | Out-Null

# GPU y CPU Gaming
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f | Out-Null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f | Out-Null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f | Out-Null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f | Out-Null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f | Out-Null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f | Out-Null
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f | Out-Null

# Core Parking
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f | Out-Null

# Prioridad CPU
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f | Out-Null

# Memoria
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f | Out-Null

# Game DVR
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f | Out-Null

# Telemetria residual
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f | Out-Null

# Drivers automaticos
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d 0 /f | Out-Null
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d 1 /f | Out-Null

Write-OK "Tweaks de registro aplicados"

# ============================================================
# TAREAS PROGRAMADAS
# ============================================================
Write-Step "Desactivando tareas programadas innecesarias"

$Tasks = @(
    "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
    "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
    "\Microsoft\Windows\Autochk\Proxy"
    "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
    "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
    "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
    "\Microsoft\Windows\Feedback\Siuf\DmClient"
    "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
    "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
    "\Microsoft\Windows\Application Experience\MareBackup"
    "\Microsoft\Windows\Application Experience\StartupAppTask"
    "\Microsoft\Windows\Maps\MapsToastTask"
    "\Microsoft\Windows\Maps\MapsUpdateTask"
)

foreach ($Task in $Tasks) {
    Disable-ScheduledTask -TaskName $Task -ErrorAction SilentlyContinue | Out-Null
}

Write-OK "Tareas programadas desactivadas"

# ============================================================
# SSD
# ============================================================
Write-Step "Optimizando disco"

fsutil behavior set DisableLastAccess 1 | Out-Null
fsutil behavior set EncryptPagingFile 0 | Out-Null

Write-OK "Disco optimizado"

# ============================================================
# LIMPIEZA
# ============================================================
Write-Step "Limpiando archivos temporales"

Remove-Item "$env:TEMP\*" -Recurse -Force
Remove-Item "C:\Windows\Temp\*" -Recurse -Force
Remove-Item "C:\Windows\Prefetch\*" -Recurse -Force

Write-OK "Temporales eliminados"

# ============================================================
# FIN
# ============================================================
Write-Host ""
Write-Host "  Sistema optimizado para gaming." -ForegroundColor White
Write-Host "  Reiniciando en 10 segundos..." -ForegroundColor DarkGray
Write-Host ""

Stop-Transcript
Start-Sleep 10
Restart-Computer -Force
