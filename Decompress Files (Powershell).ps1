# First of all we need to specify the compress types
$tipus = @("*.zip", "*.rar")

# We perform the loop to find the different types.
foreach ($tipo in $tipus)
{
    # This line find all the zips files.
    $Zips = Get-ChildItem -filter "$tipo" -path "C:\Users\DAP Informàtica\Desktop\hola" -Recurse

    # Destination folder
    $Destination = 'C:\Users\DAP Informàtica\Desktop\hola'

    #WinRAR path.
    $WinRar = "C:\Program Files\WinRAR\winrar.exe"

    #Decompress process
    foreach ($zip in $Zips)
    {
        &$Winrar x $zip.FullName $Destination
        Get-Process winrar | Wait-Process
    }
  

}

