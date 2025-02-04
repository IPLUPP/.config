#!/bin/bash

RED="\033[41m  \033[0m"
GREEN="\033[42m  \033[0m"
GAP=" "

if [ $# -lt 1 ]; then
  echo "Usage: $0 birthdate [username]"
  echo "Example: $0 1985-06-08 Joe"
  exit 1
fi

birthdate=$1
name=${2:-$USER}

life_expectancy=40
last_year_index=$((life_expectancy - 1))

case "$(uname)" in
  "Linux")
    birth_year=$(date -d "$birthdate" +"%Y")
    birth_timestamp=$(date -d "$birthdate" +%s)
    ;;
  "Darwin")
    birth_year=$(date -j -f "%Y-%m-%d" "$birthdate" +"%Y")
    birth_timestamp=$(date -j -f "%Y-%m-%d" "$birthdate" +%s)
    ;;
  *) echo "Unsupported OS"; exit 1 ;;
esac

current_year=$(date +"%Y")
current_timestamp=$(date +%s)
years_passed=$((current_year - birth_year))
weeks_passed=$(( (current_timestamp - birth_timestamp) / 604800 ))
total_weeks=$((life_expectancy * 52))
weeks_remaining=$((total_weeks - weeks_passed))

echo -e "$name, only $weeks_remaining Sundays remain\n"

for (( row=0; row<4; row++ )); do
    for (( col=0; col<10; col++ )); do
        year_index=$((row * 10 + col))
        if (( year_index < years_passed )); then
            echo -ne "${RED}${GAP}"
        else
            echo -ne "${GREEN}${GAP}"
        fi
    done
    echo
    if (( year_index != $last_year_index )); then
      echo
    fi
done

echo -e "\nHow are you going to spend these Sundays, $name?"
