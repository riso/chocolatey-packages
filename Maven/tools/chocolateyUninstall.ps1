﻿$binRoot = join-path $env:systemdrive 'bin'

### Using an environment variable to to define the bin root until we implement YAML configuration ###
if($env:chocolatey_bin_root -ne $null){
  $binRoot = join-path $env:systemdrive $env:chocolatey_bin_root
}

$version = '3.2.5'
$name = "apache-maven-$version"
$m2_home = Join-Path $binRoot $name
$m2_bin = Join-Path $m2_home 'bin'
$m2_repo = Join-Path $env:USERPROFILE '.m2'

[Environment]::SetEnvironmentVariable('M2_HOME', $null, "User")
[Environment]::SetEnvironmentVariable('MAVEN_OPTS', $null, "User")
[Environment]::SetEnvironmentVariable('M2', $null, "User")
[Environment]::SetEnvironmentVariable('M2_REPO', $null, "User")

"Please manually remove Maven ($m2_home) from the PATH environment variable."
# Remove Maven from the path environment variable
#if ($null -ne $env:path)
#{
#   $p = $env:path.Split(";") |? {$_.toLower() -ne $m2_bin}
#    $newPath = [String]::Join(";")
#    [Environment]::SetEnvironmentVariable('PATH', $newPath, "User")
#}

Remove-Item $m2_home -Recurse -Force