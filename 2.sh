#!/bin/bash

find /home/$USER -mmin -$1 -exec tar -cvf out.tar {} \;

#find [-H] [-L] [-P] [-Olevel] [-D debugopts] [path...] [expression]
#-exec COMMAND ; -exec COMMAND {} + -ok COMMAND ;
#-mmin N

#Usage: tar [OPTION...] [FILE]...
#-f, --file=ARCHIVE         use archive file or device ARCHIVE
#-c, --create               create a new archive
#-v, --verbose              verbosely list files processed
