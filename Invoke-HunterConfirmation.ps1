function Invoke-HunterConfirmation {
  param(
    $url = "https://user.aylanetworks.com/users/confirmation.json",
    $token
  )

  $tokenToJson = @{confirmation_token=$token} |ConvertTo-Json

  Invoke-RestMethod -Uri $url -Method Put -Body $tokenToJson -ContentType 'application/json'

}

Invoke-HunterConfirmation -token $Args[0]
