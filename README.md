# 🕵️ Hashes Hunter

## Overview

🔍 **Hashes Hunter** is an innovative toolkit designed for cybersecurity enthusiasts, IT professionals, and anyone in need of validating file integrity across different operating systems. With the power of two scripts – one for Windows (PowerShell) and another for Linux/Unix (Bash) – you can quickly identify files by comparing their hashes against a known list. Whether you're hunting for malicious files or ensuring data integrity, Hashes Hunter equips you with the tools you need.

## Features

- **Cross-Platform Support**: Use on Windows with PowerShell and Linux/Unix with Bash.
- **Multiple Hash Algorithms**: Supports SHA256, SHA1, and MD5 hashes.
- **Flexible Search Options**: Search entire filesystems or specific directories.
- **User-Friendly**: Progress indicators and clear results reporting.
- **Open Source**: Free to use, modify, and distribute.

## Getting Started

### Prerequisites

- **Windows**: PowerShell 5.1 or newer.
- **Linux/Unix**: Bash shell and core utilities (`sha256sum`, `sha1sum`, `md5sum`).

### Installation

1. **Clone the repository** to your local machine:

    ```git clone <repository-url>```
   
2. **Prepare your hash list** by placing it in a text file named `Hashes.txt` in the same directory as the scripts.
   
## Usage

### Windows

1. **Navigate** to the directory containing `Hashes_Hunting_Windows.ps1` using PowerShell.
2. **Modify the script** for specific directory searches (optional):
 - Open the script in a text editor.
 - Uncomment and modify the `$specificDirectory` variable to target your search.
 - Comment out the general search line as described in the script comments.
3. **Run the script**:
   ```.\Hashes_Hunting_Windows.ps1```

### Linux/Unix

1. **Navigate** to the directory containing `Hashes_Hunting_Linux.sh` using a terminal.
2. **Make the script executable**:
   ```chmod +x Hashes_Hunting_Linux.sh```
3. **Run the script**:
   ```./Hashes_Hunting_Linux.sh```

## Contributing

🤝 Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. **Fork the Project**
2. **Create your Feature Branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your Changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the Branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Questions?

If you have any questions or need further clarification, feel free to **open an issue** in the repository. We're here to help!
