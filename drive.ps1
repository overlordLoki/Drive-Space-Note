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
    throw
}

Add-Content -Path $LogFile -Value "[INFO] Running $PSCommandPath"
# verify that PoshGram is installed
if(-NOT (Get-Module -Name PoshGram -ListAvailable)){
    Add-Content -Path $LogFile -Value "[ERROR] PoshGram is not installed. Please install PoshGram"
    throw
}else{
    Add-Content -Path $LogFile -Value "[INFO] PoshGram is installed"
}
# get the hard drive information
if ($PSVersionTable.Platform -eq "Win32NT") {
    # sys is windows
    # used
    # free
}else {
    # sys is linux
    # used
    # free
    $volume = Get-PSDrive -Name $Drive
    #verify that the volume is found
    if ($volume -eq $null) {
        Add-Content -Path $LogFile -Value "[ERROR] $Drive is not found"
        throw
    }
    $total = $volume.Used + $volume.Free
    

}
# send telegram message

$botToken = 'nnnnnnnnn:xxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxx'
$chat = '-nnnnnnnnn'
Send-TelegramTextMessage -BotToken $botToken -ChatID $chat -Message "Hello"
