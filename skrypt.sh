#!/bin/bash

if [[ $1 == "--date" ]]; then
  echo $(date)
elif [[ $1 == "--logs" ]]; then
  if [[ -z $2 ]]; then
    for i in {1..100}; do
      echo "log$i.txt created by my_script.sh on $(date)" > log$i.txt
    done
  else
    for i in $(seq 1 $2); do
      echo "log$i.txt created by my_script.sh on $(date)" > log$i.txt
    done
  fi
elif [[ $1 == "--help" ]]; then
  echo "Usage:"
  echo "  my_script.sh --date             Display today's date"
  echo "  my_script.sh --logs [num]      Create [num] log files, default 
100"
  echo "  my_script.sh --help            Display this help message"
else
  echo "Invalid option. Use --help to see available options."
fi

