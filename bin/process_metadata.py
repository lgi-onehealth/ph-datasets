#! /usr/bin/env python
"""
Given a TSV file with metadata, create:
1. a file with a list of SRA IDs, one per line
2. a file with the metadata for each SRA ID, one per line
3. a YAML file with dataset metadata
"""

import argparse
import csv

__version__ = "1.0.0"

def parse_args():
    """
    Parse command line arguments
    """
    parser = argparse.ArgumentParser(description="Process metadata")
    parser.add_argument("-i", "--input", help="Input TSV file", required=True)
    parser.add_argument("-m", "--outmeta", help="Output file", default="metadata.csv")
    parser.add_argument("-s", "--outsra", help="Output file", default="sra.csv")
    parser.add_argument("-y", "--outyaml", help="Output file", default="metadataset.yml")
    parser.add_argument("-v", "--version", action="version", version="%(prog)s {}".format(__version__))
    return parser.parse_args()


def parse_metadata(input_file):
    """
    Parse metadata TSV file
    The file has a number of initial rows with key:value pairs, then an empty row, followed
    by a header row, then a list of rows with the metadata for each SRA ID.
    The key:value pairs should be captured in a dictionary, and the metadata in a list of dictionaries.
    """
    with open(input_file, "r") as f:
        dataset_meta = {}
        reader = csv.reader(f, delimiter="\t")
        # Skip initial rows
        line = next(reader)
        line = [field.strip() for field in line]
        while len(line[0]) > 0:
            dataset_meta[line[0]] = line[1]
            line = next(reader)
            if len(line) == 0:
                break
        # Read header row
        header = next(reader)
        header = [field.strip() for field in header]
        # Read metadata rows
        metadata = []
        for row in reader:
            if row and len(row[0]) > 0:
                row = [field.strip() for field in row]
                metadata.append(dict(zip(header, row)))
    return metadata, dataset_meta


def main():
    """
    Main function
    """
    args = parse_args()
    metadata, dataset_meta = parse_metadata(args.input)
    with open(args.outmeta, "w") as f:
        writer = csv.writer(f, delimiter=",")
        header = list(metadata[0].keys())
        writer.writerow(header)
        for row in metadata:
            writer.writerow(row.values())
    with open(args.outsra, "w") as f:
        writer = csv.writer(f, delimiter=",")
        for row in metadata:
            if any(prefix in row['SRArun_acc'] for prefix in ['SRR', 'ERR', 'DRR']):
                writer.writerow([row["SRArun_acc"]])    
    with open(args.outyaml, "w") as f:
        f.write("---\n")
        f.write("dataset_metadata:\n")
        for key, value in dataset_meta.items():
            f.write("  {}: {}\n".format(key, value))


if __name__ == "__main__":
    main()
    exit(0)