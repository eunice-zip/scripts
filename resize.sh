#!/bin/bash

# if there are 3 parameters
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file> <scale_percent> <target_size_kB>"
    exit 1
fi

input_file="$1"
scale_percent="$2"
target_size="$3"


if [ ! -f "$input_file" ]; then
    echo "error: '$input_file' is not exist"
    exit 1
fi

# output file
filename=$(basename -- "$input_file")
filename="${filename%.*}"
temp_file="${filename}_temp.jpg"
output_file="${filename}_resized.jpg"


convert "$input_file" -resize "${scale_percent}%" "$temp_file"

#change the percentage of quality to 85%
convert "$temp_file" -quality 85 "$temp_file"

#target size
convert "$temp_file" -define jpg:extent="${target_size}kb" "$output_file"

rm "$temp_file"


if [ $? -eq 0 ]; then
    echo "finish: output file $output_file"
else
    echo "error"
    exit 1
fi