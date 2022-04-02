function Install {
    $mpv_id = "5664FrankSkare.mpv.net_0ta2kwwjvkgap"
    $ytdlp = "yt-dlp"
    $python3 = "Python.Python.3"
    $script_path = "$env:APPDATA/mpv.net/scripts"

    Install-WingetPackage $mpv_id
    Install-ChocoPackage $ytdlp
    Install-WingetPackage $python3

    if (-Not(Test-Path -Path $script_path -PathType Container )) {
        New-Item -Path $script_path -ItemType Directory
    }
    Invoke-WebRequest -Uri "https://pastebin.com/raw/TqzZLUrD" -OutFile "$script_path/youtube-quality.lua"
    global:Invoke-GitClone "https://github.com/po5/mpv_sponsorblock.git" "$env:APPDATA/mpv.net/scripts"
}
Install