# Time-Sync
A small interface for pulling timestamps out of movie, audio, and calcium imaging files, for precise alignment of data.

To use, call `timeSync` in Matlab. Enter the full path to each file; the gui will automatically extract and display file start times.

<p align="center">
<img src=screenshot.png>
</p>

### Notes
- Calculating timestamps may take a while for some files
- Currently only compatible with .seq movies
