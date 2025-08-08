### 🚀 **GitHub Repo Creation Script**  

#### 📌 **Overview**  
This script automates the process of creating a **GitHub repository**, setting up **main and develop branches**, and pushing them to GitHub.  

#### 🛠 **Features**  
✅ Creates a new **GitHub repository**  
✅ Prompts user to set the repo as **public** or **private**  
✅ Initializes a **Git repository locally**  
✅ Adds **GitHub as a remote**  
✅ Creates and pushes both **main** and **develop** branches  

---

### ⚡ **Usage**  

#### 🍎 **Mac Users - Easy Method**  
For Mac users, you can use the `.command` file for easier execution:

1. **Rename the script** (or use the provided `repo-init.command` file):
   ```sh
   cp repo-init.sh repo-init.command
   ```

2. **Make it executable**:
   ```sh
   chmod +x repo-init.command
   ```

3. **Drag to Dock** and click to run, or **double-click** in Finder!

#### ✅ **Alternative Method - Command Line**  

**Step 1: Make the Script Executable**  
```sh
chmod +x repo-init.sh
```

**Step 2: Run the Script**  
```sh
./repo-init.sh
```

#### 🖊 **Step 3: Follow the Prompts**  
- **Enter Repository Visibility:**  
  ```sh
  Enter repository visibility (public/private):
  > public
  ```
- **Enter Repository Name:**  
  ```sh
  Enter the repository name:
  > my-awesome-repo
  ```

#### 🎉 **Step 4: Done!**  
The script will automatically:
- Create the repository on GitHub
- Initialize a local Git repository
- Push both `main` and `develop` branches

---

### 🔧 **Requirements**  
- **GitHub CLI (`gh`)** → Install via [GitHub CLI](https://cli.github.com/)  
- **jq** (for parsing GitHub API responses) → Install via `brew install jq` (Mac) or `sudo apt install jq` (Linux)  
- **Git** → Install via `brew install git` (Mac) or `sudo apt install git` (Linux)  

---

### 📌 **Example Output**  
```sh
Enter repository visibility (public/private):
> private
Enter the repository name:
> my-project
✅ Repository 'my-project' created as 'private' and both 'main' and 'develop' branches pushed!
```

Now, your repo is ready for development! 🚀