# Taken from https://stackoverflow.com/a/36934083/2560557

$proc = Start-Process -filePath $program -ArgumentList $arguments -PassThru

# keep track of timeout event
$timeouted = $null # reset any previously set timeout

# wait up to x seconds for normal termination
$proc | Wait-Process -Timeout 60 -ea 0 -ev timeouted

if ($timeouted)
{
    # terminate the process
    $proc | kill
}

exit 0