function Install {
    $mpv_id = "5664FrankSkare.mpv.net_0ta2kwwjvkgap"
    $ytdlp = "yt-dlp"
    Install-WingetPackage($mpv_id)
    Install-ChocoPackage($ytdlp)
}
Install