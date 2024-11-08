#!/bin/bash

# Script to check which pages in a PDF should be printed in color and count the total number of color pages
# Requires ghostscript (install with: sudo apt-get install ghostscript)

set -euo pipefail

# Default document name, can be overridden by a command-line argument
DOC_NAME=${1:-diss_beispiel.pdf}

# Check if the specified file exists
if [[ ! -f "$DOC_NAME" ]]; then
    echo "Error: File '$DOC_NAME' does not exist."
    exit 1
fi

echo "Analyzing color pages in: $DOC_NAME"
echo "color page numbers:"
gs -q  -o - -sDEVICE=inkcov ${DOC_NAME} | grep -v '^ 0.00000  0.00000  0.00000' -n | cut -d ':' -f1 | paste -sd ", "

echo "total number of color pages in document:"
gs -q  -o - -sDEVICE=inkcov ${DOC_NAME} | grep -v '^ 0.00000  0.00000  0.00000' | wc -l