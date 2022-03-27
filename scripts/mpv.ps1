function Install {
    $mpv_id = "5664FrankSkare.mpv.net_0ta2kwwjvkgap"
    $ytdlp = "yt-dlp"
    Install-Winget-Package($mpv_id)
    Install-Choco-Package($ytdlp)
}
Install