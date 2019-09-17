# Script Name: Start-LoadTest.ps1
# Tag: cerner_2^5_2019
function Start-LoadTest {
  param(
    $url,
    $iterations,
    [switch]
    $silent
  )
  $count = 1
  if ($true -eq $silent) {
    Write-Output "Starting load test in silence."
    $resp = Invoke-WebRequest -Uri $url|Out-Null
  } else {
    Write-Output "Starting load test."
    $resp = Invoke-WebRequest -Uri $url
  }
  while ($count -le $iterations) {
    Write-Output "Iteration $count"
    $resp
    $count = $count + 1
  }   
}
