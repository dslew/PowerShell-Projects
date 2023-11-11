#'PowerShell Advanced' by David Fitzpatrick

#Module 2 Lab A
#Create an Array list and use .Add() and .Remove()

$myArrayList = New-Object System.Collections.ArrayList
$myArrayList.Add('Jack')
$myArrayList.Add('Jill')

#check if jack and jill have been added
$myArrayList

#remove
$myArrayList.Remove('Jill')

#check if jill has been removed
$myArrayList

#"simplified"
$list = New-Object -TypeName System.Collections.Generic.List[String]
$list.Add('Pete')
$list.Add('Marry')
$list
$list.Remove('Pete')
$list

#Lab B
#Create a FilePicker and pick C:\PowerShell-Labs\Test-Text.txt
Add-Type -AssemblyName System.Windows.Forms
$pickItem = New-Object -TypeName System.Windows.Forms.OpenFileDialog

#FilePicker "parameters"
$pickItem.InitialDirectory = "C:\PowerShell-Labs"
$pickItem.Filter = 'txt files (*.txt) | *.txt'

#clean up output on terminal
$result = $pickItem.ShowDialog()

#display results
Write-Host $pickItem.FileName 'selected'
Write-Host 'content:'
$printText = Get-Content -Path $pickItem.FileName
Write-Host $printText

#Lab C
#Create a FilePicker and allow multi select
Add-Type -AssemblyName System.Windows.Forms
$pickItem = New-Object -TypeName System.Windows.Forms.OpenFileDialog

#FilePicker "parameters"
$pickItem.InitialDirectory = "C:\PowerShell-Labs"
$pickItem.Filter = 'txt files (*.txt) | *.txt'
$pickItem.Multiselect = $True
$pickItem.Title = "selected files"
$result = $pickItem.ShowDialog()

#display results
foreach($item in $pickItem.FileNames){

    Write-Host ''
    Write-Host $item 'selected'
    Write-Host 'content:'
    $printText = cat $item
    Write-Host $printText
    Write-Host ''

}