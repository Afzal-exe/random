$resourceGroupName = "Afzal-resources" 
$vmName = "test-vmDuplicate"  
$script = @"  
    powershell.exe -File "C:\Users\Azure\script.ps1"       
"@
$output = (az vm run-command invoke --resource-group $resourceGroupName --name $vmName --command-id RunPowerShellScript --scripts "$script" --query 'value[0].message' -o tsv )   
Write-Output $output
$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = $output