
#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <resolution> <file_with_urls>" 
    exit 1
fi

# Define resolution and file path.
resolution=$1 
file=$2 #一個網址一行


if [ ! -f "$file" ]; then
    echo "File not found: $file"
    exit 1
fi

# Loop through each line (URL) in the file.
while IFS= read -r url; do
    echo "Downloading video from: $url at resolution: ${resolution}p"
    yt-dlp -f "bestvideo[height<=${resolution}]+bestaudio/best[height<=${resolution}]" "$url"
done < "$file"