# Shell Scripts

This is a collection of scripts made in Shell to automate tasks, opening files, executing other scripts, etc.

## List of Scripts

- **[projects.sh](#projects-sh)**: `List Projects in a specific Folder and Open the Code Editor.`
- **[sync-obsidian.sh](#sync-obsidian-sh)**: `Sync an Obsidian vault with a Git remote repository.`
- **[script.sh](#script-sh)**: `Other Script.`

## Add Script to Application Browser

### **Linux**

- Clone or Copy the Script
- Move the Script to your Scripts folder | **Optional** 
- Make Directory `mkdir -p ~/.local/bin` | **if the directory does not exist**
- Make a symbolic link of the Script
- `ln -s ~/Your_Script_Folder/projects.sh ~/.local/bin/projects`
- Ready for use  
![Script on Application Browser](https://i.imgur.com/0pLYe2r.png)

---

### **Other O.S**: `soon`

## Scripts

<a id="projects-sh"></a>
## projects.sh


List Projects/Repositories in a specific Folder and Open the Code Editor or IDE.  

**Change for your use**

- **Line 1** Shell Interpreter:
```bash
#!/bin/bash
```

- **Line 4** Directory of Projects/Repositories:
```bash
DIRECTORIO=~/Documentos/projects/
```

- **Line 13** Terminal Emulator and size:
```bash
xfce4-terminal --geometry 80x20 -e
```

- **Line 45** Code Editor or IDE:
```bash
code \"\$selected_project\";
```
 
- **Preview**  
![Script on Application Browser](https://i.imgur.com/8bFjzAR.png) 

---

<a id="sync-obsidian-sh"></a>
## sync-obsidian.sh

Shell script to automatically sync an Obsidian vault with a Git remote repository.

### Features

- Automatic commit and push of changes
- Pull before push to avoid conflicts
- Internet connection check
- Retry mechanism for failed pushes
- Detailed logging system
- Designed to run via cron job

### Installation

1. Clone or copy the script to your preferred location
2. Make the script executable:
   ```bash
   chmod +x sync-obsidian.sh
   ```

### Configuration

 - Edit these variables at the top of the script:

    ```bash
    REPO_DIR="$HOME/Documents/Obsidian Vault"  # Local Obsidian vault path
    REMOTE="origin"                            # Git remote name
    BRANCH="main"                              # Git branch to sync with
    MAX_RETRIES=3                              # Number of push retry attempts
    LOG_DIR="$HOME/.logs/sync-obsidian"        # Log directory path
    ```

### Usage

 - Manual Execution

    ```bash
    ./sync-obsidian.sh
    ```

### Automated Execution (via Cron)

 - Add to your crontab (e.g., to run every 15 minutes):

    ```bash
    */30 * * * * /path/to/sync-obsidian.sh >/dev/null 2>&1
    ```

### Logs

 - Logs are stored in:

    ```bash
    $HOME/.logs/sync-obsidian/
    sync-obsidian.log: General execution log
    ```

### Requirements

 - Git installed and configured
 - Obsidian vault initialized as Git repository
 - Remote repository properly set up
 - Internet connection for sync operations

### Error Handling

 - Connection checks before attempting sync
 - Automatic conflict resolution (pull before push)
 - Multiple retry attempts for failed pushes
 - Comprehensive logging

### Other Script. 

---

<a id="script-sh"></a>
### script.sh

**Change for your use**

- **Line 1** Shell Interpreter:
```bash
#!/bin/bash
```

---

## License

MIT License Copyright (c) 2025 felipecastillo-b (Felipe Castillo)