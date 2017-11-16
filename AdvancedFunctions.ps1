Function MyFirstAdvancedFunction
{
[CmdletBinding()]
Param()
}


#My Basic Function
Function Create-BasicFunction
{
    param(
    [string]$variable 
    )
    Write-output $variable
}

Create-BasicFunction -variable 'random text'

#My Advanced Function
Function Create-AdvancedFunction
{
    [CmdletBinding()] 
    param(
    [Parameter(Mandatory,ValueFromPipeLine)]
    [ValidateSet('PSConfAsia','Awesome')]
    [string]$variable
    )
    Write-output $variable
}

Create-BasicFunction -variable 'random text' | Create-AdvancedFunction

Create-BasicFunction -variable 'PSConfAsia' | Create-AdvancedFunction

#forgot to pass input variable
Create-AdvancedFunction

#My Advanced Function
Function Create-AdvancedFunction
{
    [CmdletBinding()] 
    param(
    [Parameter(Mandatory)]
    [ValidateSet('PSConfAsia','Awesome')]
    [System.Management.Automation.va
    [string]$variable
    )
    Write-output $variable
}





#Why do we need to validate? How many types of validations do we need?


Function Get-MobileNumbers
{
[CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        $phonenumber
    )
    #here comes the command to set the RAM value
}
Get-MobileNumbers


#Validation in place
Function Get-MobileNumbers
{
[CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        
        [ValidatePattern("\d{3}-\d{3}-\d{4}")]
        $phonenumber
    )
    #here comes the command to set the RAM value
}
Get-MobileNumbers

#234-637-7268

#check mandatory parameters for existing cmdlets
#No mandatory params
(get-Help -Name Get-Service -Detailed).Syntax

# Only Path is mandatory
(get-Help -Name Get-Content -Detailed).Syntax

#(Get-Command -Name Get-Content).Parameters.Path.Attributes

#Validation Types  -- 
#[System.Management.Automation.va

#ValidateScript
Function ParseFile
{
[CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [ValidateScript({Test-Path -Path $_ -Pathtype leaf})]
        $path,
        [Parameter(Mandatory)]
        [ValidateSet('1', '2')]
        $filenumber
    )

}
ParseFile

#Can write a bigger script inside the scriptblock. Can also output a message if it is false.


#Accept input from Pipeline
Function  Get-VirtualMachine
 {
     [CmdletBinding()]
     [OutputType([System.Management.Automation.PSCustomObject])]
     param
     (
        [Parameter(Mandatory)]
        [string]$Name
     )
     [pscustomobject]@{ 'Name'= $Name; 'HyperVHost'= 'HYPERV1'}
 }

 Function  Set-VirtualMachine
 {
     [CmdletBinding()]
     [OutputType([System.Management.Automation.PSCustomObject])]
     param
     (
        [Parameter(Mandatory)]
        [pscustomobject]$InputObject
     )
     process
     {
        Write-Host $InputObject.Name
        Write-Host '------------'        Write-Host $InputObject.HyperVHost
     }     
 }

 #verify outputs a custom object
 Get-VirtualMachine -Name 'MyVM' | Get-Member


 Function  Get-VirtualMachine
 {
     [CmdletBinding()]
     [OutputType([System.Management.Automation.PSCustomObject])]
     param
     (
        [Parameter()]
        [string]$Name
     )
     0..10 | foreach {
     [pscustomobject]@{ 'Name'= "VM$PSItem"; 'HyperVHost'= 'HYPERV1'}
    }
 }

 
 
 
 
 
 
 
 #Use whatif as a test run
 $WhatIfPreference = $false
 Get-ChildItem -Path 'C:\Users\rakes\Desktop\powerpi-master' -Recurse | remove-item -recurse -whatif

 $ConfirmPreference = 'None','Low','Medium','High';
 Get-ChildItem -Path 'C:\Users\rakes\Desktop\powerpi-master' -Recurse | remove-item -recurse -whatif












