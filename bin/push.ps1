param
(
    [Parameter(Mandatory = $False, ValueFromPipeline = $True, Position = 0)]
    [string]
    $inputMessage,
	[Parameter(Mandatory = $False)]
	[string]
	$message,
	[Parameter(Mandatory = $False)]
	[string]
	$title,
	[Parameter(Mandatory = $False)]
	[string]
	$target
)

#To send all the buffer and not the last line
if($inputMessage)
{
	$message = $inputMessage
}
else
{
	throw "Message is required!"
}

Import-Module "$PSScriptRoot/Modules/StringModule.psm1" -DisableNameChecking
$settingsObject = Get-Content -Path "$PSScriptRoot/../.data/pushover_app.json.secret" | ConvertFrom-Json

#Trim Message
if ($message.Length -gt $settingsObject.messageMaxLength) {
	$message = $message.Substring(0, $settingsObject.messageMaxLength)
	$message += "..."
}

#Trim title
if ($title.Length -gt $settingsObject.titleMaxLength) {
	$title = $title.Substring(0, $settingsObject.titleMaxLength)
	$title += "..."
}

##TODO
# Add url, url_title, priority, attachment, attachment_base64

try
{
    $pushoverUsrToken = Get-HostedKeyValue $settingsObject.pushoverUsrTokenEncr
    $pushoverApiToken = Get-HostedKeyValue $settingsObject.pushoverApiTokenEncr

    $parameters = New-Object System.Collections.Specialized.NameValueCollection
    $parameters.add("token", $pushoverapitoken)
    $parameters.add("user", $pushoverusrtoken)
	if ($PSBoundParameters.ContainsKey('title') -eq "True")
	{
		$parameters.add("title", $title)
	}
	if ($PSBoundParameters.ContainsKey('target') -eq "True")
	{
		$parameters.add("device", $target)
	}
	#$parameters.add("html", 1)
    $parameters.add("message", $message)
    $client = New-Object System.Net.Webclient

    $client.UploadValues($settingsObject.pushoverEndpoint, $parameters) > $null

    Write-Host "Message sent!"
}
catch
{
    Write-Host "Something went wrong, error occured:"
    Write-Host $_
}
