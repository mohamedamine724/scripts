# Primer de tot definim els tipus de compressió..
$tipus = @("*.zip", "*.rar")

#Realitzem el bucle per provar els diferents tipos (en aquest cas farà 2 voltes perquè en la array tenim 2 tipus)
foreach ($tipo in $tipus)
{
    #Aquesta línia busca els fitxers comprimits.
    $Zips = Get-ChildItem -filter "$tipo" -path "C:\Users\DAP Informàtica\Desktop\hola" -Recurse

    #Definim la ruta de destí.
    $Destination = 'C:\Users\DAP Informàtica\Desktop\hola'

    #Definim la ruta del programa WinRAR.
    $WinRar = "C:\Program Files\WinRAR\winrar.exe"

    #Aquest procés descomprimeix els fitxers.
    foreach ($zip in $Zips)
    {
        &$Winrar x $zip.FullName $Destination
        Get-Process winrar | Wait-Process
    }
  

}

