# Taken from https://stackoverflow.com/a/36934083/2560557

$proc = Start-Process -filePath $program -ArgumentList $arguments -PassThru

# wait up to x seconds for normal termination
$proc | Wait-Process -Timeout $timeout -ea 0 -ev timeouted

if ($timeouted)
{
    # terminate the process
    $proc | kill
}

exit 0
