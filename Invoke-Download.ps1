# Script Name: Invoke-Download.ps1
# Tag: cerner_2^5_2019
function Invoke-Download {

    param (
        $Uri,
        $OutFile,
        $Verify
    )
    
    try
    {
        $resp = (Invoke-WebRequest -Uri "$Uri" -OutFile "$OutFile")

        if ($false -eq $Verify){
            return $resp
        } else {
            return (Get-FileHash $OutFile -Algorithm $Verify).hash
        }
    }
    catch [System.Net.WebException],[System.IO.IOException]
    {
        "Unable to download from $Uri."
    }
    catch
    {
        "An error occurred that could not be resolved."
    }
}
