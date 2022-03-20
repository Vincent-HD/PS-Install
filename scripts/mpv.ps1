function Install {
    $package_id = "5664FrankSkare.mpv.net_0ta2kwwjvkgap"
    Install-Test
    # if (-Not (Installed)) {
    #     "Not installed"
    #     # Install-Mpv
    # } else {
    #     "Installed"
    # }
    function Install-Mpv {
        winget install --accept-package-agreements --accept-source-agreements "$package_id"
    }
    function Install-Test {
        "prout"
        $package = winget list --id "$package_id"
        if ($package.count -lt 0) {
            return True
        } else {
            return False
        }
    }
}
Install