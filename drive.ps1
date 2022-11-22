# log direcctory
if ($PSVersionTable.Platform -eq "Win32NT") {
    $LogPath = "C:\Logs"
}elseif ($PSVersionTable.Platform -eq "Unix") {
    $LogPath = "/var/log"
}else {
    $LogPath = "."
}
# log file
$LogFile = "$LogPath\driveCheck.log"
#test path
try {
    if (-not (Test-Path $LogPath -ErrorAction Stop)) {
        #output dir is not found. create the directory
        New-Item -ItemType Directory -Path $LogPath -ErrorAction Stop | Out-Null
        New-Item -ItemType File -Path $LogFile -ErrorAction Stop | Out-Null
    }
}
catch {
    {1:<#Do this if a terminating exception happens#>}
}

# verify if the log directory exists
# verify that PoshGram is installed
# get the hard drive information
# send telegram message

$botToken = 'nnnnnnnnn:xxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxx'
$chat = '-nnnnnnnnn'
Send-TelegramTextMessage -BotToken $botToken -ChatID $chat -Message "Hello"
