try
{
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$users_numbers = [Microsoft.VisualBasic.Interaction]::InputBox('Number users to create..','Users Creation Script by Mohamed') -match '[0-9]'

$wshell = New-Object -ComObject Wscript.Shell

For ($i=0; $i -lt $users_numbers; $i++) {
    

        $name = [Microsoft.VisualBasic.Interaction]::InputBox('User name','Users Creation Script by Mohamed')
        $password = Read-Host "`n Password" -AsSecureString
        $full_name = [Microsoft.VisualBasic.Interaction]::InputBox('Full name','Users Creation Script by Mohamed')

        $enable = Read-Host "1 -> Enable Account 0 -> Disable Account"
    
        if($enable = '0')
        {
            New-LocalUser $name -Password $password -FullName $full_name -PasswordNeverExpires -UserMayNotChangePassword -Disabled
        }
        else
        {
            New-LocalUser $name -Password $password -FullName $full_name -PasswordNeverExpires -UserMayNotChangePassword
        }
    
        #Write-Host $name,$full_name
        #Write-Host "User successfully created ! `n"
        

        $wshell.Popup("User successfully created ! ",0,"Done",0x1)
       

}

}

catch{Write-Host "Algo ha salido mal.."}
