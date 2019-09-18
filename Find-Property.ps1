# Script Name: Find-Property
# Tag: cerner_2^5_2019
function Find-Property {
    param(
      $directory,
      $property
    )
    $testPath = Test-Path $directory
    if ($false -eq $testPath) {
      Write-Output "Invalid directory, please check again."
    } else {
      $propertyFiles = (Get-ChildItem -file $directory).Name
      foreach ($file in $propertyFiles) {
        $value = Get-Content $directory\$file |Select-String $property
        if ($null -eq $value) {
          ## Do nothing    
        } else {
          Write-Output "$file - $value"
        }
      }
    }
  }