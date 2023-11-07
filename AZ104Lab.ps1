#AZ-104 Azure Admin Lab
#Creating Resource groups and resources with Powershell
#
#
#update Azure module
Update-Module -Name Az

#Connect to Azure - tenantID required for my account due to enabled MFA
Connect-AzAccount -TenantId xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#check current resource groups
Get-AzResourceGroup

#Create Reource group with same location as existing resource group
Write-Host "Creating a new Resource Group. Please enter Name:"
$rgName = Read-Host
$location = (Get-AzResourceGroup -Name IT-RG-001).location
New-AzResourceGroup -Name $rgName -Location $location

#Create VM - not part of lab. wanted to learn regardless.
Write-Host "Creating a new VM. Please enter existing RG:"
$rgGrp = Read-Host
Write-Host "Creating a new VM. Please enter Name:"
$vmName = Read-Host

#VM params - could continue on with read-host for all inputs, but for now I just wanted to get the basics.
#I guess User input isn't really required when code is being produced for IaC.
$params = @{
    ResourceGroupName = $rgGrp
    Name = $vmName
    Location = $location
    Image ='MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest'
    VirtualNetworkName = 'VNet-001'
    SubnetName = 'Subnet-001'
    SecurityGroupName = 'NSG-001'
    PublicIpAddressName ='VM-Pub-IP-001'
    OpenPorts = 80,3389
}

New-AzVM @params

#create Disk
Write-Host "Creating a new Disk. Please enter existing RG:"
$rgGrp = Read-Host
Write-Host "Creating a new Disk. Please enter Name:"
$diskName = Read-Host

$diskConfig = New-AzDiskConfig -Location $location -CreateOption Empty -DiskSizeGB 32 -Sku Standard_LRS
New-AzDisk -ResourceGroupName $rgGrp -DiskName $diskName -Disk $diskConfig

#Change disk size
New-AzDiskUpdateConfig -DiskSizeGB 64 | Update-AzDisk -ResourceGroupName $rgGrp -DiskName $diskName

#check/change SKU
(Get-AzDisk -ResourceGroupName $rgGrp -Name $diskName).sku
New-AzDiskUpdateConfig -sku Premium_LRS | Update-AzDisk -ResourceGroupName $rgGrp -DiskName $diskName
