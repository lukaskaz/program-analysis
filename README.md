# program-analysis
Supporting set of tools for c++ program decomposition and profiling
--
Usage:
script/build.sh <srcfile_without_ext> [<report> <console_ouput>] 
scrpt/report.sh <srcfile_without_ext> [<console_ouput>]
script/clean.sh

Reports are stored in ./out directory

Scripts meaning:
build.sh - compilation of given source with basic elf sections report (<bin>.s)
report.sh - generating extended elf info report + time profiling (<bin>.report)
clean.sh - removing all output files (binaries + reports)

