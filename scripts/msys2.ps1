# Clear PATH
$orig_path = $env:PATH;
$env:PATH = ($env:PATH.Split(';') | Where-Object { $_ -like 'c:\windows*' }) -join ';'

# Run command
$command = $args[0]
cmd /S /C "`"C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\VsDevCmd.bat`" -arch=amd64 -host_arch=amd64 && C:/msys64/msys2_shell.cmd -defterm -no-start -c `"$command`""

# Restore path
$env:PATH = $orig_path
