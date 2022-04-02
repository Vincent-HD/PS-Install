function Install {
    $mpv_id = "5664FrankSkare.mpv.net_0ta2kwwjvkgap"
    $ytdlp = "yt-dlp"
    $python3 = "Python.Python.3"
    $script_path = "$env:APPDATA/mpv.net/scripts"
    $repo_sponsorblock = "https://github.com/po5/mpv_sponsorblock.git"

    Write-Output -ForegroundColor Yellow "Installation de MPV - ID: $mpv_id"
    Install-WingetPackage $mpv_id
    Write-Output -ForegroundColor Yellow "Installation terminée"
    Write-Output -ForegroundColor Yellow "Installation de ytdlp"
    Install-ChocoPackage $ytdlp
    Write-Output -ForegroundColor Yellow "Installation terminée"
    Write-Output -ForegroundColor Yellow "Installation de Python3 - ID: $python3"
    Install-WingetPackage $python3
    Write-Output -ForegroundColor Yellow "Installation terminée"
    
    if (-Not(Test-Path -Path $script_path -PathType Container )) {
        Write-Output -ForegroundColor Yellow "Dossier manquant, création du dossier: $script_path"
        New-Item -Path $script_path -ItemType Directory
    }
    Write-Output -ForegroundColor Yellow "Téléchargement du fichier de configuration dans: $script_path/youtube-quality.lua"
    Invoke-WebRequest -Uri "https://pastebin.com/raw/TqzZLUrD" -OutFile "$script_path/youtube-quality.lua"
    Write-Output -ForegroundColor Yellow "Téléchargement terminé"

    Write-Output -ForegroundColor Yellow "Clone du repo: $repo_sponsorblock"
    global:Invoke-GitClone $repo_sponsorblock "$env:APPDATA/mpv.net/scripts"
    Write-Output -ForegroundColor Yellow "Clone terminé"
}
Install