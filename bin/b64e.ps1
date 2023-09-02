param
(
    [Parameter(Mandatory = $False, ValueFromPipeline = $True, Position = 0)]
    [string]
    $inputMessage
)

#echo $inputMessage | openssl base64
echo $inputMessage | python -m base64 -e