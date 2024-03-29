# program-analysis
Supporting set of tools for c++ program decomposition and profiling
--
Usage:<br>
script/build.sh <srcfile_without_ext> *[\<report\> <console_ouput>]*<br>
scrpt/report.sh <srcfile_without_ext> *[<console_ouput>]*<br>
script/clean.sh<br>
\--<br>
Reports are stored in `./out` directory<br>
\--<br>
Scripts meaning:<br>
\> build.sh - compilation of given source with basic elf sections report (<bin>.s)<br>
\> report.sh - generating extended elf info report + time profiling (<bin>.report)<br>
\> clean.sh - removing all output files (binaries + reports)<br>
\--<br>
BBBCCC
