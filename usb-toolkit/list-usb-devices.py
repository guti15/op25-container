#!/bin/python3
"""
For a more verbose output of usb-devices run 'list-usb-devices.sh'
This script is meant to print out the title of devicess name, removing a lot of meta-data.
"""

import subprocess
import re  # For pattern matching, to make it more accurate

# Run the usbip list -r command and capture the output
try:
    result = subprocess.run(['usbip', 'list', '-r', 'host.docker.internal'], capture_output=True, text=True, check=True)

    if result.stdout:
        # Split the output into lines
        lines = result.stdout.splitlines()

        # Filter lines that start with eight spaces and a device ID pattern (e.g., "0-8:")
        device_pattern = re.compile(r'^        [0-9]+-[0-9]+:')  # Matches lines like "        0-8:"

        filtered_lines = []
        for line in lines:
            if device_pattern.match(line):  # Check if the line matches the pattern
                filtered_lines.append(line.strip())  # Remove extra spaces and add to list

        if filtered_lines:
            # Print the filtered lines to the console
            for line in filtered_lines:
                print(line)  # Output to terminal

            # Optionally, write to a file (as per your previous request)
            with open("usb-devices-list.txt", "w") as file:
                for line in filtered_lines:
                    file.write(line + "\n")  # Write each line to the file
            print("Filtered output has been written to 'usb-devices-list.txt' in the current directory.")
        else:
            print("No device lines found in the output.")
    else:
        print("No output received from the command.")
except subprocess.CalledProcessError as e:
    print(f"Error running the command: {e}")
except FileNotFoundError:
    print("The 'usbip' command is not found. Make sure it's installed and in your PATH.")