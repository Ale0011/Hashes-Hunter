#!/bin/bash

# Path to the file containing hashes
hashFilePath="Hashes.txt"

# Read hashes from the file
mapfile -t hashes < "$hashFilePath"

# Function to calculate the SHA256 hash of a file
get_file_hash_sha256() {
    sha256sum "$1" | awk '{ print $1 }'
}

# Function to calculate the SHA1 hash of a file
get_file_hash_sha1() {
    sha1sum "$1" | awk '{ print $1 }'
}

# Function to calculate the MD5 hash of a file
get_file_hash_md5() {
    md5sum "$1" | awk '{ print $1 }'
}

# Exclude /proc, /sys, and /dev directories
find / -type f -not \( -path "/proc/*" -o -path "/sys/*" -o -path "/dev/*" \) 2>/dev/null | while read -r file; do
    echo "Analyzing: $file"

    # Calculate hashes
    fileHashSHA256=$(get_file_hash_sha256 "$file")
    fileHashSHA1=$(get_file_hash_sha1 "$file")
    fileHashMD5=$(get_file_hash_md5 "$file")

    # Check if any of the hashes match
    for hash in "${hashes[@]}"; do
        if [[ "$hash" == "$fileHashSHA256" || "$hash" == "$fileHashSHA1" || "$hash" == "$fileHashMD5" ]]; then
            echo "Hash found: $fileHashSHA256 (SHA256), $fileHashSHA1 (SHA1), $fileHashMD5 (MD5) in $file"
            break
        fi
    done
done

echo "Analysis complete."