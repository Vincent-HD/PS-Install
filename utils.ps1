function global:Test-WingetPackageInstalled {
    param (
        [string]$package_id
    )
    $package = winget list --id "$package_id"
    $package = [string]::Join(" ", $package) # La commande renvoie un tableau de string, évite le foreach
    if ($package.Contains("$package_id")) {
        return $true
    } else {
        return $false
    }
}
function global:Install-WingetPackage {
    param (
        [string]$package_id
    )
    if (-Not (Test-WingetPackageInstalled($package_id))) {
        winget install --accept-package-agreements --accept-source-agreements "$package_id"
        if ($?) {
            "An error occured during installation, exiting ..."
            exit
        }
    } else {
        "Package $package_id already installed"
    }
}

function global:Test-ChocoPackageInstalled {
    param (
        [string]$package_id
    )
    $packages = choco list -lo -r --exact $package_id
    if ($null -eq $packages) {
        return $false
    } else {
        return $true
    }
}

function global:Install-ChocoPackage {
    param (
        [string]$package_id
    )
    if (-Not (Test-ChocoPackageInstalled($package_id))) {
        choco install --no-progress -y -r $package_id
        if ($?) {
            "An error occured during installation, exiting ..."
            exit
        }
    } else {
        "Package $package_id already installed"
    }
}