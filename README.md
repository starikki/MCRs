# MCRs

With this macro you can:

    one button export the current frame to .png file which is named by the 1st active zone's name.
    one button export each of a range of zones to a .png file each named by its zone name, you can define the start and finish zone number.
    one button activate the next zone (only).

*you need to enable extendmcr addon at tecplot.add if it wasn't already, but it should be on by default

To use:

    After opening your tecplot, drag the .mcr file into the tecplot window,
    Open quick macro panel from scripting> quick macro...
    You will find four more buttons at the bottom of the panel, some may appear in 2nd page.
    You may have to close and re-open the
    Click "SET SAVE DIR" button and input a directory you want to save. Then you are ready to go.


If you want to have it auto loaded at startup:
Rename the .mcr file to tecplot.mcr and replace the one at tecplot root folder. (other quick macros will disappear)
or, add the content (except line 1) of my .mcr file to the end tecplot.mcr.

To have quick macro panel start with tecplot:
append  -showpanel after the line in target section in property of tecplot shortcut.
It will look like "C:\Program Files\Tecplot\Tec360 2013R1\bin\tec360.exe" -showpanel