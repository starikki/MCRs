#!MC 1400
############################################################
$!MacroFunction
  Name = "SET SAVE DIR"
  ShowInMacroPanel = true

$!PROMPTFORTEXTSTRING |SaveDIR|
   INSTRUCTIONS = "Enter the SAVEDIR"
   
$!ENDMACROFUNCTION
###############################################################################
# a macro function to export images of each of the selected zones
# Files will be exported to this .mcr's directory 
# File names will be each zone names
# !!!Require ExtendedCommand addon
$!MacroFunction
  Name = "Export Zone Range"
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
$!EXPORTSETUP  EXPORTFNAME = '|SaveDIR|\_|ZoneName|.png' 
$!EXPORT EXPORTREGION = CURRENTFRAME 
$!ENDLOOP 
$!ENDMACROFUNCTION

#################################################################################
# Export the Current Selected ! single zone

$!MacroFunction
  Name = "Export Current Zone"
  ShowInMacroPanel = true

$!LOOP |NUMZONES|

  $!ExtendedCommand 
    CommandProcessorID='extendmcr'
    Command='QUERY.ISZONEACTIVE |LOOP| YesZone'
  $!ExtendedCommand 
    CommandProcessorID='extendmcr'
    Command='QUERY.ZONENAMEBYNUM |LOOP| ZoneName'


$!IF '|YesZone|' == 'YES'

$!EXPORTSETUP EXPORTFORMAT = PNG 
$!EXPORTSETUP IMAGEWIDTH = 1920 
$!EXPORTSETUP USESUPERSAMPLEANTIALIASING = YES
$!EXPORTSETUP  EXPORTFNAME = '|SaveDIR|\_|ZoneName|.png' 
$!EXPORT EXPORTREGION = CURRENTFRAME 
$!BREAK
$!ENDIF

$!ENDLOOP 

$!ENDMACROFUNCTION

###################################################################################
# Select the Next active Zone
$!MacroFunction
  Name = "Act Next Zone Only"
  ShowInMacroPanel = true

$!LOOP |NUMZONES|

  $!ExtendedCommand 
    CommandProcessorID='extendmcr'
    Command='QUERY.ISZONEACTIVE |LOOP| YesZone'

$!IF '|YesZone|' == 'YES'

$!VARSET |NextZone| = (|LOOP| + 1)
$!ACTIVEFIELDMAPS = [|NextZone|] 
$!BREAK
$!ENDIF

$!ENDLOOP 

$!ENDMACROFUNCTION