# Script PowerShell pour récupérer les informations système

$systemeInfo = Get-CimInstance -ClassName Win32_OperatingSystem
$cpuInfo = Get-CimInstance -ClassName Win32_Processor
$memoireInfo = Get-CimInstance -ClassName Win32_PhysicalMemory
$disqueInfo = Get-CimInstance -ClassName Win32_DiskDrive
$reseauInfo = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration
$biosInfo = Get-CimInstance -ClassName Win32_BIOS
$carteMereInfo = Get-CimInstance -ClassName Win32_BaseBoard

Write-Host "Système d'exploitation : $($systemeInfo.Caption) $($systemeInfo.OSArchitecture) - $($systemeInfo.Version)"
Write-Host "Nom de l'ordinateur : $($systemeInfo.CSName)"
Write-Host "Fabricant : $($carteMereInfo.Manufacturer)"
Write-Host "Modèle : $($carteMereInfo.Product)"
Write-Host "Version du BIOS : $($biosInfo.SMBIOSBIOSVersion)"
Write-Host "Processeur : $($cpuInfo.Name)"
Write-Host "Cœurs du processeur : $($cpuInfo.NumberOfCores)"
Write-Host "Mémoire RAM totale : $([math]::round($memoireInfo.Capacity / 1GB, 2)) Go"
Write-Host "Disques durs :"


foreach ($disque in $disqueInfo) {
    Write-Host "  - $($disque.Model) ($([math]::round($disque.Size / 1GB, 2)) Go)"
}

Write-Host "Cartes réseau :"
foreach ($reseau in $reseauInfo) {
    Write-Host "  - $($reseau.Description): $($reseau.IPAddress)"
}
