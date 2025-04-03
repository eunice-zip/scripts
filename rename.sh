#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <topic>"
    exit 1
fi

# 檔案類別(e.g.國家,活動名)
topic=$1


file_count=$(ls -1 | wc -l)
if [ "$file_count" -eq 0 ]; then
    echo "No files found in the current directory."
    exit 1
fi

# rename all files in the folder
for file in *; do
    # 確保不是目錄
    if [ -f "$file" ]; then
        mv "$file" "${topic}${file}"
    fi
done

echo "Renaming completed. All files start with '${topic}'."
