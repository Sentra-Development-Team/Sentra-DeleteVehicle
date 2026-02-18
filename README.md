# Delete Vehicle Script
#### Author: Sentra Developments
##### We have provided this script as Source-Code. We ask that you please do not modify any code to claim this resource as your own. If you have any suggestions on other scripts we should release as source-code, feel free to create a suggestion inside our discord.

## Discord:
### [Discord Link | Sentra Developments](https://discord.gg/7XYX2TAFKt)

## Setup
Setup is quite simple. Follow these simple steps in-order:

### 1. Download the Repository from this GitHub
Click the green "<> Code" button towards the upper right of the repository main page. Select the "Download Zip File" option, and wait for it to download in your browser.

### 2. Extract the File & Drop Into your Server's Files
Right click the newly downloaded .zip file, and click "Extract All". Then click "Extract" on the menu. After it extracts, it will open the file explorer on your computer of where it extracted at.

**You can do one of the following to get it into your server:**
**If the FiveM Server is hosted on an external machine:**
- If using WinSCP or FileZilla or another SFTP transfer client, drag and drop the extracted files into your resources/ folder.

- If using Remote Desktop Connection (RDC) you will need to Right-Click the Extracted Folder, and click the "Copy" button. Then go to the RDC window, and navigate to your resources/ folder, and Right-Click then select the "Paste" button.

### 3. Modify the config/config.lua script

- You will need to decide if you want a cooldown. If you do want a cooldown, set EnableCooldown to true in the config.lua. If you do not want a cooldown for deleting vehicles, set it to false.

**Enabled:**
```Config.EnableCooldown = true```

**Disabled:**
```Config.EnableCooldown = false```

- **If you do have EnableCooldown set to true,** you will also need to decide how many seconds after deleting a vehicle they will have to wait to delete another one. It is in seconds, and the default is set to 5 seconds. 

*For example, if you wanted to set the cooldown to 3 seconds, you'd set it like this:*
```Config.CooldownTime = 3```

- I do not suggest modifying the DV Radius, but if you want it to only delete vehicles closer, shrink the number from the default to lower. If you want to make it higher, set it to a number higher then the default.

**Higher:**
```Config.DeleteRadius = 6.0```

**Lower:**
```Config.DeleteRadius = 4.0```

#### If you have any questions, or need any additional help besides the descriptive docs that were already provided, please open a ticket inside our Sentra Development Discord. (link found above)
