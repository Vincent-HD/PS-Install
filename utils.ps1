function global:Test-WingetPackageInstalled([string] $package_id) {
    $package = winget list --id "$package_id"
    $package = [string]::Join(" ", $package) # La commande renvoie un tableau de string, évite le foreach
    if ($package.Contains("$package_id")) {
        return $true
    } else {
        return $false
    }
}
function global:Install-WingetPackage([string] $package_id, [bool] $verbose = $true) {
    if (-Not (Test-WingetPackageInstalled $package_id)) {
        Write-Host -ForegroundColor Yellow "Installation du package - ID: $package_id"
        winget install --accept-package-agreements --accept-source-agreements "$package_id"
        Invoke-RefreshEnv
        Write-Host -ForegroundColor Yellow "Installation terminée"
    } elseif ($verbose) {
        "Package $package_id already installed"
    }
}

function global:Test-ChocoPackageInstalled([string] $package_id) {
    $packages = choco list -lo -r --exact $package_id
    if ($null -eq $packages) {
        return $false
    } else {
        return $true
    }
}

function global:Install-ChocoPackage([string] $package_id, [bool] $verbose = $true) {
    if (-Not (Test-ChocoPackageInstalled $package_id)) {
        Write-Host -ForegroundColor Yellow "Installation du package - ID: $package_id"
        choco install --no-progress -y -r $package_id
        Invoke-RefreshEnv
        Write-Host -ForegroundColor Yellow "Installation terminée"
    } elseif ($verbose) {
        "Package $package_id already installed"
    }
}

function global:Invoke-GitClone([string] $repo, [string] $path = '.') {
    Install-WingetPackage "Git.Git" $false
    $git_tmp = "$path/tmpgit"
    New-Item -Path $git_tmp -ItemType Container
    git clone $repo $git_tmp
    Move-Item -Path "$git_tmp/*" -Destination $path
    Remove-Item -Path $git_tmp -Recurse -Force
}

function global:Invoke-RefreshEnv() {
    $env:Path = [System.Environment]::ExpandEnvironmentVariables([System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User"))
}