# Script Name: Restart-Device.ps1
# Tag: cerner_2^5_2019

function Restart-Device {
    param (
        $deviceName
    )
    $device = Get-PnpDevice|Where-Object {$_.friendlyname -like "$deviceName"}
    $device |Disable-PnpDevice -Confirm:$false
    $device |Enable-PnpDevice -Confirm:$false
}
