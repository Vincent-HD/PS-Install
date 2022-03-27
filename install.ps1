
$scripts_path = "./scripts"
$install_list = @(
    @{
        Name = "MPV.net"
        Filename = "mpv"
    }
    @{
        Name = "test"
        Filename = "sqdsq"
    }
)
.\utils.ps1 # Utils functions
$install_list.ForEach({
    # Test if file exist (Leaf = is a file)
    if (Test-Path -Path "$scripts_path/$($_.Filename).ps1" -PathType Leaf) {
        # Include file
        Invoke-Expression -Command "$scripts_path/$($_.Filename).ps1"
    }
})