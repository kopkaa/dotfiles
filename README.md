# Dotfiles - `.aliases`

This README documents the `.aliases` file included in your dotfiles. These aliases are created to simplify your command-line workflows, enhance productivity, and streamline common tasks.

---

## Table of Contents

1. [General Aliases](#general-aliases)
2. [Git Aliases](#git-aliases)
3. [Project Navigation Aliases](#project-navigation-aliases)
5. [Database Aliases](#database-aliases)
6. [Windows-Specific Aliases](#windows-specific-aliases)

---

### General Aliases

| Alias             | Command                                                                                           | Description                                             |
|-------------------|---------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `ls`             | `ls -F --color=auto --show-control-chars`                                                        | List files with colors and classify by type.           |
| `rm`             | `rm -i`                                                                                          | Prompt before removing files.                          |
| `ll`             | `ls -l -h`                                                                                       | List files in long format with human-readable sizes.    |
| `df`             | `df -h`                                                                                          | Display disk space usage in human-readable format.      |
| `lt`             | `ls --human-readable --size -1 -S --classify`                                                    | List files sorted by size in human-readable format.     |
| `count_files`    | `find . -type f | wc -l`                                                                          | Count the number of files in the current directory.     |
| `tree`           | Custom implementation of a directory tree.                                                       | Print a tree-like structure of directories.            |

---

### Git Aliases

| Alias     | Command                                | Description                    |
|-----------|----------------------------------------|--------------------------------|
| `gc`      | `git checkout`                        | Shortcut for switching branches. |
| `gitmail` | `git config user.email "kopkayan@outlook.cz"` | Configure the Git user email. |

---

### Project Navigation Aliases

| Alias   | Command                                 | Description                                     |
|---------|-----------------------------------------|-------------------------------------------------|
| `pr`    | `cd ~/Documents/Projects`              | Quickly navigate to the projects directory.    |

---


### Database Aliases

| Alias              | Command                                                                                 | Description                             |
|--------------------|-----------------------------------------------------------------------------------------|-----------------------------------------|
| `pg_dump_ydealapp` | `pg_dump -U postgres -n ydealapp > ydealapp_$(date +"%Y-%m-%d").sql`                    | Backup the `ydealapp` database.         |

---

### Windows-Specific Aliases

| Alias          | Command                                                                                   | Description                                      |
|-----------------|-------------------------------------------------------------------------------------------|--------------------------------------------------|
| `pwd-win`      | `cygpath -w $(pwd)`                                                                       | Convert the current directory to Windows format. |
| `chrome-no-cors` | `"C:\Program Files\Google\Chrome\Application\chrome.exe" --disable-web-security --user-data-dir="C:\chrome_dev"` | Open Chrome with disabled CORS. |

---

# Dotfiles - `.functions`



| Function          | Command                                                                                      | Description                                                                 |
|-------------------|----------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| `mkd`            | `mkdir -p "$@" && cd "$_"`                                                                   | Creates a new directory and enters it.                                      |
| `targz`          | Creates a `.tar.gz` archive using `zopfli`, `pigz`, or `gzip`.                               | Compresses directories/files with optimal tools for size reduction.         |
| `fs`             | `du -sh [options]`                                                                           | Displays the size of a file or directory in a human-readable format.        |
| `diff`           | `git diff --no-index --color-words "$@"`                                                     | Uses Git’s colored diff for file comparisons when available.                |
| `dataurl`        | Generates a `data:` URL from a file.                                                         | Converts a file into a base64-encoded data URL.                             |
| `server`         | `python -m SimpleHTTPServer [port]`                                                          | Starts a basic HTTP server in the current directory.                        |
| `phpserver`      | `php -S [ip]:[port]`                                                                         | Starts a PHP server, optionally specifying the IP and port.                 |
| `gz`             | Compares original and gzipped file sizes.                                                    | Displays the compression ratio for a file.                                  |
| `getcertnames`   | Uses OpenSSL to retrieve SSL certificate details for a domain.                               | Shows the Common Name (CN) and Subject Alternative Names (SANs) of a cert.  |
| `tre`            |                      | Displays a tree structure of directories with hidden files and color.       |
