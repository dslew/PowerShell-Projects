#Practice and follow-alongs from Udemy course "PowerShell Advanced" by David Fitzpatrick
#
#Properties and Methods Review
$service = Get-Service -Name 'Spooler'
$service
$service.Name
$service.Stop()
$service.Start()
$service.Refresh()

#Properties and Methods Review cont'd
$processObject = Get-Process -ProcessName 'notepad'
$processObject | Get-Member
$processObject.Id
$processObject.Id.GetType()

#Static Properties
[math]::Round(3.5)
[math]::Min(10,5)

#Adding Assemblies - Works only on PowerShell 5.1
Add-Type -AssemblyName system.speech
$speakObject = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
$speekObject.GetType
$speekObject | Get-Member
$speakObject | Get-Member
$speakObject.Speak('hello!')
$speakObject.Speak('Powershell is cool')

#Adding Assemblies and using Methods and Properties
Add-Type -AssemblyName system.servieprocess
Add-Type -AssemblyName system.serviceprocess
$serviceObject = New-Object -TypeName System.ServiceProcess.ServiceController
$serviceObject = New-Object -TypeName System.ServiceProcess.ServiceController('spooler')
$serviceObject
$serviceObject | Get-Member
$serviceObject.Stop()
$serviceObject.Refresh()
$serviceObject.Start()
$serviceObject.Refresh()
$serviceObject

#Adding Assemblies and using Methods and Properties Cont'd
Add-Type -AssemblyName System.Windows.Forms
$fileToOpen = New-Object -TypeName System.Windows.Forms.OpenFileDialog

$fileToOpen.InitialDirectory = 'C:\source'
$fileToOpen.Filter = 'All my files (*.*) | *.*'
$fileToOpen.ShowDialog()
$fileToOpen.FileName
Write-Host $fileToOpen.FileName 'selected'
