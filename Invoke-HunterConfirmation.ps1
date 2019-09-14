# Invoke-HunterConfirmation
# I bought a Hunter Ceiling Fan with smart control features. The app is stuck in a loop on sign-in by confirming your email. 
# I read online that other people with similar issues encountered similar issues. One person de-compiled the apk and found a 
# way to submit a json token to get it to work. He used postman, but I chose to use PowerShell. It worked and I can get into 
# the app now. If I could improve upon this in any way, I would add error handling but for a simple PUT to a rest endpoint, 
# this did the trick.
# Reference: https://davidmburke.com/2019/06/01/how-to-set-up-a-hunter-fan-wifi-control-by-decompiling-their-app/
# Tag: cerner_2^5_2019

function Invoke-HunterConfirmation {
  param(
    $url = "https://user.aylanetworks.com/users/confirmation.json",
    $token
  )

  $tokenToJson = @{confirmation_token=$token} | ConvertTo-Json

  Invoke-RestMethod -Uri $url -Method Put -Body $tokenToJson -ContentType 'application/json'

}

Invoke-HunterConfirmation -token $Args[0]
