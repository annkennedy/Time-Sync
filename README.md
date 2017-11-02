# Time-Sync
A small interface for pulling timestamps out of movie, audio, and calcium imaging files, for precise alignment of data.

To use, call `timeSync` from the command line in Matlab. Enter the full path to each file; the text box to the right will display file start times.

<p align="center">
<img src=screenshot.png>
</p>

### Notes
- Calculating timestamps may take a while for some files
- Currently only compatible with .seq movies
- Ca imaging timestamps not yet implemented
