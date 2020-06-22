$env:PATH = ($env:PATH.Split(';') | Where-Object { $_ -like 'c:\windows*' }) -join ';'
$env:MSYS2_PATH_TYPE = "inherit"

$command = $args

Write-Output "Running command $command in MSYS2 environment"

$cmd_str = "`
    `"`C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\VsDevCmd.bat`" -arch=amd64 -host_arch=amd64 && `
    C:/msys64/msys2_shell.cmd -defterm -no-start -c `"$command`"";

Start-Process -FilePath "cmd" -Wait -ArgumentList ("/S", "/C", $cmd_str)
