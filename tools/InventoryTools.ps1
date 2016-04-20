# Enable-PSRemoting
# Set-WSManQuickConfig -SkipNetworkProfileCheck
Function Get-MDSNetInventory {

  param(
  
    [Parameter(ValueFromPipeLine=$true)]
    [string]$Computername = $env:computername
    )
  
    BEGIN{}
    PROCESS{
      $result = @()
      
      $nics = Get-CimInstance -Classname Win32_NetworkAdapterConfiguration -ComputerName $Computername
      
      foreach ($n in $nics) {
        $object = [pscustomobject]@{
                  computername = $computerName;
                  MacAddress = $n.MACAddress;
                  IPAddress = $n.IPAddress;
                  Caption = $n.Caption; 
    
          }
           $result += $object
        }
        
        Write-Output $result
           
      }
      
     
    END{}

}

Get-MDSInventory 
