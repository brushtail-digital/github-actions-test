$env:PATH = ($env:PATH.Split(';') | Where-Object { $_ -like 'c:\windows*' }) -join ';'
$env:MSYS2_PATH_TYPE = "inherit"

$script = $args[0]
$script_location = $(& "C:/msys64/usr/bin/cygpath" "$script")

$cmd_str = "`"C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\VsDevCmd.bat`" -no_logo -arch=amd64 && C:/msys64/usr/bin/bash --noprofile --norc -eo pipefail `"$script_location`"";

& "$env:COMSPEC" "/S" "/C" "$cmd_str"
