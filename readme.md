# Shell Scripts

This is a collection of scripts made in Shell to automate tasks, opening files, executing other scripts, etc.

## List of Scripts

- **[projects.sh](#projects-sh)**: `List Projects in a specific Folder and Open the Code Editor.`
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
### projects.sh


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

<a id="script-sh"></a>
### script.sh


Other Script. 

**Change for your use**

- **Line 1** Shell Interpreter:
```bash
#!/bin/bash
```

---

## License

MIT License Copyright (c) 2025 felipecastillo-b (Felipe Castillo)