# Script Name: Add-UserToLocalGroup
# Tag: cerner_2^5_2019
function Add-UserToLocalGroup {
  param(
    $server,
    $user,
    $domain,
    $group
  )

  $AD = [ADSI]"WinNT://$server/$group,group" 
  $AD.psbase.Invoke("Add",([ADSI]"WinNT://$domain/$user").path)
}
