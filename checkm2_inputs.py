import pandas as pd
import sys
import os

default_output_file = "results.csv"

# Check the number of arguments
if len(sys.argv) == 3:
    filename = sys.argv[1]
    algorithmName = sys.argv[2]
    output_file = default_output_file
elif len(sys.argv) == 4:
    filename = sys.argv[1]
    algorithmName = sys.argv[2]
    output_file = sys.argv[3]
else:
    print("Usage: script.py <filename> <algorithmName> [output_file]")
    sys.exit(1)


if '.tsv' not in filename:
    print('Must be .tsv file')
    sys.exit(1) 


bins = pd.read_csv (filename, sep = '\t')


HQBins = bins.query("Completeness > 90 and Contamination < 5").shape[0]
MQBins = bins.query("Completeness > 50 and Contamination < 10").shape[0]
algorithm_name = ' '.join(algorithmName.split()[:-1])
algorithm_number = algorithmName.split()[-1]

# Prepare the results dictionary
results = {
    "Algorithm Name": algorithm_name,
    "Algorithm Seed": algorithm_number,
    "High Quality Bins": HQBins,
    "Medium Quality Bins": MQBins,
    "Total Bins": bins.shape[0]
}

# Define the output CSV file name

# Check if the output file exists
if os.path.exists(output_file):
    # Append the new results to the existing CSV file
    results_df = pd.read_csv(output_file)
    results_df = results_df.append(results, ignore_index=True)
else:
    # Create a new CSV file with the results
    results_df = pd.DataFrame([results])

# Save the results back to the CSV file
results_df.to_csv(output_file, index=False)