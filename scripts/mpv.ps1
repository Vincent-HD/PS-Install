function Install {
    $mpv_id = "5664FrankSkare.mpv.net_0ta2kwwjvkgap"
    $ytdlp = "yt-dlp"
    $python3 = "Python.Python.3"
    $script_path = "$env:APPDATA/mpv.net/scripts"
    $repo_sponsorblock = "https://github.com/po5/mpv_sponsorblock.git"

    Write-Output "Installation de MPV - ID: $mpv_id"
    Install-WingetPackage $mpv_id
    Write-Output "Installation terminée"
    Write-Output "Installation de ytdlp"
    Install-ChocoPackage $ytdlp
    Write-Output "Installation terminée"
    Write-Output "Installation de Python3 - ID: $python3"
    Install-WingetPackage $python3
    Write-Output "Installation terminée"
    
    if (-Not(Test-Path -Path $script_path -PathType Container )) {
        Write-Output "Dossier manquant, création du dossier: $script_path"
        New-Item -Path $script_path -ItemType Directory
    }
    Write-Output "Téléchargement du fichier de configuration dans: $script_path/youtube-quality.lua"
    Invoke-WebRequest -Uri "https://pastebin.com/raw/TqzZLUrD" -OutFile "$script_path/youtube-quality.lua"
    Write-Output "Téléchargement terminé"

    Write-Output "Clone du repo: $repo_sponsorblock"
    global:Invoke-GitClone $repo_sponsorblock "$env:APPDATA/mpv.net/scripts"
    Write-Output "Clone terminé"
}
Install