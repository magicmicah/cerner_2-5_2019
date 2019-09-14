# Script Name: Invoke-HunterConfirmation
# Tag: cerner_2^5_2019

function Invoke-HunterConfirmation {
  param(
    $url = "https://user.aylanetworks.com/users/confirmation.json",
    $token
  )
  $tokenToJson = @{confirmation_token=$token} | ConvertTo-Json
  $resp = Invoke-RestMethod -Uri $url -Method Put -Body $tokenToJson -ContentType 'application/json'
  Write-Output $resp
}
if ($null -eq $Args[0]) {
  Write-Output "Execute with an argument: ./Invoke-HunterConfirmation.ps1 -token 12345"
} else {
  Invoke-HunterConfirmation -token $Args[0]
}
