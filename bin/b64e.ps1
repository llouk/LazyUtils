param
(
    [Parameter(Mandatory = $False, ValueFromPipeline = $True, Position = 0)]
    [string]
    $inputMessage
)

echo $inputMessage | openssl base64