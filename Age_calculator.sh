#!/bin/bash

echo -n "Enter your Name: "
read name

echo -n "Enter your Date of Birth (YYYY:MM:DD): "
read dob

# Convert DOB into a date format Bash can work with
dob_formatted=$(date -d "${dob//:/-}" +%Y-%m-%d 2>/dev/null)

# Check if the entered DOB is valid
if [ $? -ne 0 ]; then
    echo "Invalid date format. Please enter DOB in YYYY:MM:DD Eg:(19960712) format."
    exit 1
fi

# Get current date and convert both to seconds since epoch
dob_sec=$(date -d "$dob_formatted" +%s)
now_sec=$(date +%s)

# Calculate age in years
age_years=$(( (now_sec - dob_sec) / (365*24*60*60) ))

echo "Hello $name!"
echo "Your current Age is $age_years years."
