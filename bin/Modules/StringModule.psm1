function Get-HostedKeyValue
{
    param
    (
        [string]
        $val
    )
    $secureKey = $val | ConvertTo-SecureString
    $Marshal = [System.Runtime.InteropServices.Marshal]
    $Bstr = $Marshal::SecureStringToBSTR($secureKey)
    $key = $Marshal::PtrToStringAuto($Bstr)
    $Marshal::ZeroFreeBSTR($Bstr)
    return $key
}

function Generate-SecureHostedKeyValue
{
    param
    (
        [string]
        $val
    )
	$secureVal = ConvertTo-SecureString -String $val -AsPlainText -Force
    return ConvertFrom-SecureString $secureVal
}
