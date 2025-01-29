#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p ~/Pictures/Screenshots

# Generate a timestamp
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

# Save the screenshot
gscreenshot-cli -s -f '/home/ip/Downloads/TEMP'

