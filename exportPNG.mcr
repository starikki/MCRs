#!MC 1400

# a function to export images of each of the selected zones

$!MacroFunction
  Name = "Export PNG V2.0"
  ShowInMacroPanel = true

$!PROMPTFORTEXTSTRING |STARTZONE|
   INSTRUCTIONS = "Enter the number of the starting zone:"

$!PROMPTFORTEXTSTRING |ENDZONE|
   INSTRUCTIONS = "Enter the number of the ending zone:"

$!VARSET |INTERVAL| = (|ENDZONE| - |STARTZONE| + 1)

$!EXPORTSETUP EXPORTFORMAT = PNG 
$!EXPORTSETUP IMAGEWIDTH = 1920 
$!EXPORTSETUP USESUPERSAMPLEANTIALIASING = YES

$!LOOP |INTERVAL|
$!VARSET |CurrentZone| = (|LOOP| + |STARTZONE| -1)

  $!ExtendedCommand 
    CommandProcessorID='extendmcr'
    Command='QUERY.ZONENAMEBYNUM |CurrentZone| ZoneName'
$!ACTIVEFIELDMAPS = [|CurrentZone|] 
$!REDRAW 
$!EXPORTSETUP  EXPORTFNAME = '|macrofilepath|\_|ZoneName|.png' 
$!EXPORT EXPORTREGION = CURRENTFRAME 
$!ENDLOOP 