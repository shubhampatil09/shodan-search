## Shodan Search Script

The Shodan search script is a command-line tool that allows you to search for information about IP addresses using the [Shodan API](https://developer.shodan.io/api).

### Installation

To install the Shodan search script on your Linux machine, follow these steps:

   ```
   git clone https://github.com/shubhampatil09/shodan-search/
   ```
   ```
   cd shodan-search
   ```

   ```
   chmod +x shodan-search.sh
   ```

  `./shodan-search.sh` 

   ```
   Usage: shodan-search [OPTIONS] [IP ADDRESS]

   Options:
   -i, --input    Path to file containing IP addresses (one per line)
   -o, --output   Path to output file
   ```

  If the script runs successfully, you can move it to a location that's in your system's `PATH` to make it accessible from anywhere on your system:

   ```
   sudo mv shodan-search.sh /usr/local/bin/shodan-search
   ```

   This will allow you to run the script from anywhere on your system using `shodan-search` followed by the appropriate command-line options.

### Usage

To use the Shodan search script, follow these steps:

1. Open a terminal window and navigate to the directory where the script is installed.

2. To search for information about a single IP address, enter the following command:

   ```
   shodan-search [IP ADDRESS]
   ```

   Replace `[IP ADDRESS]` with the IP address you want to search for.

3. To search for information about multiple IP addresses stored in a file, create a text file with one IP address per line, then enter the following command:

   ```
   shodan-search -i [INPUT FILE] -o [OUTPUT FILE]
   ```

   Replace `[INPUT FILE]` with the path to the input file containing the IP addresses, and replace `[OUTPUT FILE]` with the path to the output file where you want to save the results.

   For example:

   ```
   shodan-search -i input.txt -o output.txt
   ```

   This will search for information about each IP address in the `input.txt` file and save the results to the `output.txt` file.
