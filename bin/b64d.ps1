param
(
    [Parameter(Mandatory = $False, ValueFromPipeline = $True, Position = 0)]
    [string]
    $inputMessage
)

#echo $inputMessage | openssl base64 -d
echo $inputMessage | python -m base64 -d