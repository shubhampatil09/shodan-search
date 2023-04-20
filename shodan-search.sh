#!/bin/bash

# Default values for input and output file paths
IP_FILE=""
OUTPUT_FILE=""

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -i|--input)
      IP_FILE="$2"
      shift
      shift
      ;;
    -o|--output)
      OUTPUT_FILE="$2"
      shift
      shift
      ;;
    *)
      # Treat any non-flag argument as an IP address
      IP="$1"
      shift
      ;;
  esac
done

# Check if an IP address or input file was provided
if [[ -z "$IP" && -z "$IP_FILE" ]]; then
  echo "Error: No IP address or input file provided."
  exit 1
fi

# If an IP address was provided, execute the Shodan search for that address
if [[ -n "$IP" ]]; then
  echo "Retrieving information for IP address $IP..."
  curl -v "https://internetdb.shodan.io/$IP" | tee -a "$OUTPUT_FILE"
  printf "\n" >> "$OUTPUT_FILE" # append a new line to the output file
  exit 0
fi

# If an input file was provided, loop through the IP addresses in the file
if [[ -n "$IP_FILE" ]]; then
  # Check if the input file exists
  if [ ! -f "$IP_FILE" ]; then
    echo "Input file does not exist."
    exit 1
  fi

  # Loop through the IP addresses in the input file
  while read ip; do
    # Execute the Shodan search command for the current IP address
    echo "Retrieving information for IP address $ip..."
    curl  "https://internetdb.shodan.io/$ip" | tee -a "$OUTPUT_FILE"
    printf "\n" >> "$OUTPUT_FILE" # append a new line to the output file
  done < "$IP_FILE"

  echo "Done."
fi
