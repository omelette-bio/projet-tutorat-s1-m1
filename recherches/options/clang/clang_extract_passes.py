import sys

# Ensure the user provides a number or character as a command-line argument
if len(sys.argv) < 2:
    print("Usage: python3 program.py <number_or_character>")
    sys.exit(1)

# Get the number/character from the command-line argument
suffix = sys.argv[1]

# Update file names with the given suffix
input_file = f"passesO{suffix}.txt"
output_file = f"O{suffix}_passes.data"

# Initialize a hash set to store unique pass names
unique_passes = set()

# Process the input file
try:
    with open(input_file, "r") as f:
        lines = f.readlines()
        for line in lines:
            words = line.split()
            if len(words) > 2 and words[0] == "Running" and words[1] == "pass:":
                unique_passes.add(words[2])
except FileNotFoundError:
    print(f"Error: File '{input_file}' not found.")
    sys.exit(1)

# Write unique passes to the output file
with open(output_file, "w") as f2:
    for pass_name in sorted(unique_passes):  # Sorting for consistent output
        f2.write(pass_name + "\n")

print(f"Unique passes written to '{output_file}'.")
