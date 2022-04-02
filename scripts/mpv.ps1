function Install {
    $mpv_id = "5664FrankSkare.mpv.net_0ta2kwwjvkgap"
    $ytdlp = "yt-dlp"
    $python3 = "Python.Python.3"
    $mpv_path = "$env:APPDATA/mpv.net"
    $script_path = "$mpv_path/scripts"
    $repo_sponsorblock = "https://github.com/po5/mpv_sponsorblock.git"

    Install-WingetPackage $mpv_id
    Install-ChocoPackage $ytdlp
    Install-WingetPackage $python3
    
    if (-Not(Test-Path -Path $script_path -PathType Container )) {
        Write-Host -ForegroundColor Yellow "Dossier manquant, création du dossier: $script_path"
        New-Item -Path $script_path -ItemType Directory
    }
    Write-Host -ForegroundColor Yellow "Téléchargement du fichier de configuration dans: $script_path/youtube-quality.lua"
    Invoke-WebRequest -Uri "https://pastebin.com/raw/TqzZLUrD" -OutFile "$script_path/youtube-quality.lua"
    Write-Host -ForegroundColor Yellow "Téléchargement terminé"

    Write-Host -ForegroundColor Yellow "Clone du repo: $repo_sponsorblock"
    global:Invoke-GitClone $repo_sponsorblock "$env:APPDATA/mpv.net/scripts"
    Write-Host -ForegroundColor Yellow "Clone terminé"
    Write-Host -ForegroundColor Yellow "Copie des fichiers de configuration"
    Copy-Item -Path "conf/mpv/*" -Destination $mpv_path -Force
}
Install