# Time-Sync
A small interface for pulling timestamps out of movie, audio, and calcium imaging files, for precise alignment of data.

To use, call `timeSync` from the command line in Matlab, which launches the gui. Enter the full paths to each file you'd like to sync; the text box to the right will give you a preview of the start time of each file.

Calculating timestamps may take a while for some files.

Currently only compatible with .seq movies. (Also Ca imaging part isn't working yet.)
