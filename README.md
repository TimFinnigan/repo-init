### 🚀 **GitHub Repo Creation Script**  

#### 📌 **Overview**  
This script automates the process of creating a **GitHub repository**, setting up **main and develop branches**, and pushing them to GitHub.  

#### 🛠 **Features**  
✅ Creates a new **GitHub repository** (private by default)  
✅ Allows setting the repo as **public** using `--public`  
✅ Initializes a **Git repository locally**  
✅ Adds **GitHub as a remote**  
✅ Creates and pushes both **main** and **develop** branches  

---

### ⚡ **Usage**  

#### ✅ **Step 1: Make the Script Executable**  
```sh
chmod +x repo_init.sh
```

#### 🌍 **Step 2: Run the Script**  
- **Create a private repository (default):**  
  ```sh
  ./repo_init.sh
  ```
- **Create a public repository:**  
  ```sh
  ./repo_init.sh --public
  ```

#### 🖊 **Step 3: Enter Your Repository Name**  
When prompted, enter the name of your new repository.

---

### 🔧 **Requirements**  
- **GitHub CLI (`gh`)** → Install via [GitHub CLI](https://cli.github.com/)  
- **jq** (for parsing GitHub API responses) → Install via `brew install jq` (Mac) or `sudo apt install jq` (Linux)  
- **Git** → Install via `brew install git` (Mac) or `sudo apt install git` (Linux)  

---

### 📌 **Example Output**  
```sh
Enter the repository name:
my-project
✅ Repository 'my-project' created as private and both 'main' and 'develop' branches pushed!
```

Now, your repo is ready for development! 🚀