# MCRs

With this macro you can:
one button export the current frame and current zone to .png file which is named by zone name.
one button export a range of zones each to a .png file each named by its zone name.
one button activate the next zone (only).

*you need to enable extendmcr addon at tecplot.add if it wasn't already, but it should be on by default

To use:
After opening your tecplot, drag the .mcr file into the tecplot window,
then open quick macro panel from scripting> quick macro...
You will find four more buttons at the bottom of the panel, some may appear in 2nd page.
Click "SET SAVE DIR" button and input a directory you want to save. Then you are ready to go.

If you want to have it auto loaded at startup:
Rename the .mcr file to tecplot.mcr and replace the one at tecplot root folder.
or add the content (except line 1) into the tecplot.mcr at
