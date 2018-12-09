#!/bin/bash
# rfe.sh: Renaming file extensions
#
#         refe old_extension new_extension
#
# Example:
# To rename all *.git files in working directory to *.jpg,
#       rfe gif jpg
# from: https://www.tldp.org/LDP/abs/html/parameter-substitution.html#EX6


E_BADARG=65

case $# in
  0|1)            # The vertical bar means "or" in this context.
  echo "Usage: `basename $0` old_file_suffix new_file_suffix"
  exit $E_BADARGS # If  0 or 1 arg, then bail out.
  ;;
esac


for filename in *.$1
# Traverse lsit of files ending with 1st argument.
do
  mv $filename ${filename%$1}$2
  # Strip off part of filename matchign 1st argument
  #+ then append 2nd argument
done

exit 0
