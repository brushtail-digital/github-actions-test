$env:PATH = ($env:PATH.Split(';') | Where-Object { $_ -like 'c:\windows*' }) -join ';'
$env:MSYS2_PATH_TYPE = "inherit"
$script = $args[0]

Write-Output "$script"

$cmd_str = "`
    `"`C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\VsDevCmd.bat`" -no_logo -arch=amd64 && `
    C:/msys64/usr/bin/bash --noprofile --norc -eo pipefail $script";

Write-Output $cmd_str

Start-Process -FilePath $env:COMSPEC -Wait -ArgumentList ("/S", "/C", $cmd_str)
