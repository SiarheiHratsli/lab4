#!/bin/bash

if [[ $1 == "--date" || $1 == "-d" ]]; then
  echo $(date)

elif [[ $1 == "--logs" || $1 == "-l" ]]; then
  if [[ -z $2 ]]; then
    for i in {1..100}; do
      echo "log$i.txt created by my_script.sh on $(date)" > log$i.txt
    done
  else
    for i in $(seq 1 $2); do
      echo "log$i.txt created by my_script.sh on $(date)" > log$i.txt
    done
  fi

elif [[ $1 == "--init" ]]; then
  git clone https://github.com/SiarheiHratsli/lab4
  export PATH=$PATH:/path/to/repo

elif [[ $1 == "--error" || $1 == "-e" ]]; then
  if [[ -z $2 ]]; then
    for i in {1..100}; do
      mkdir -p error$i && echo "error $i" > error$i/error$i.txt
    done
  else
    for i in $(seq 1 $2); do
      mkdir -p error$i && echo "error $i" > error$i/error$i.txt
    done
  fi

elif [[ $1 == "--help" || $1 == "-h" ]]; then
  echo "Usage:"
  echo "  my_script.sh --date OR -d                    Display today's date"
  echo "  my_script.sh --logs [num] OR -l [num]        Create [num] log files, default 
100"
  echo "  my_script.sh --error [num] OR -e [num]       Create [num] error directories and files, default 100"
echo " my_script.sh --init 			       Clone the entire repository to the current directory and set the PATH environment variable"
  echo "  my_script.sh --help OR -h                    Display this help message"
else
  echo "Invalid option. Use --help to see available options."
fi
