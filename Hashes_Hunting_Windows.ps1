# Path to the file containing hashes
$hashFilePath = "Hashes.txt"

# Read hashes from the file
$hashes = Get-Content $hashFilePath

# Function to get the SHA256 hash of a file
function Get-FileHashSHA256($filePath) {
    return (Get-FileHash -Path $filePath -Algorithm SHA256).Hash.ToLower()
}

# Function to get the SHA1 hash of a file
function Get-FileHashSHA1($filePath) {
    return (Get-FileHash -Path $filePath -Algorithm SHA1).Hash.ToLower()
}

# Function to get the MD5 hash of a file
function Get-FileHashMD5($filePath) {
    return (Get-FileHash -Path $filePath -Algorithm MD5).Hash.ToLower()
}

# Retrieve all files in the system
$files = Get-ChildItem -Path C:\ -Recurse -File -ErrorAction SilentlyContinue

# Path to a specific directory you want to search in
# $specificDirectory = "C:\Users\User\Downloads\test"

# Retrieve all files in the specific directory
# $files = Get-ChildItem -Path $specificDirectory -Recurse -File -ErrorAction SilentlyContinue

# Create a progress bar
$progress = 0
$totalFiles = $files.Count
Write-Host "Total files to analyze: $totalFiles"

foreach ($file in $files) {
    $progress++
    $status = "Analyzing {0}/{1}: {2}" -f $progress, $totalFiles, $file.FullName
    Write-Progress -Activity "Searching for matching hashes" -Status $status -PercentComplete (($progress / $totalFiles) * 100)

    # Hash calculation and comparison
    $fileHashSHA256 = Get-FileHashSHA256 $file.FullName
    $fileHashSHA1 = Get-FileHashSHA1 $file.FullName
    $fileHashMD5 = Get-FileHashMD5 $file.FullName
    if ($hashes -contains $fileHashSHA256 -or $hashes -contains $fileHashSHA1 -or $hashes -contains $fileHashMD5) {
        Write-Host "Hash found: $fileHashSHA256 (SHA256), $fileHashSHA1 (SHA1), $fileHashMD5 (MD5) in $($file.FullName)"
    }
}

Write-Host "Analysis complete."
