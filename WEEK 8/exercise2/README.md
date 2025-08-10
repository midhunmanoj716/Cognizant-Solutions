# GitDemo - Week 8 Hands-on

This project demonstrates basic Git operations along with Notepad++ integration and usage of `.gitignore`, as part of the Week 8 lab exercise.

## 📁 Folder Contents

- `welcome.txt`: A sample file added and committed using Git
- `.gitignore`: Configuration file to ignore `.log` files and `log/` folder
- `README.md`: Documentation of all steps performed

---

## ✅ Step-by-Step Summary

### 🛠️ Git Setup and Configuration

```bash
git config --global user.name "Adin Mohan"
git config --global user.email "adinmohan1211@gmail.com"
```

### 📝 Notepad++ Integration

1. Added Notepad++ to system PATH: `C:\Program Files\Notepad++`
2. Set as default Git editor:
   ```bash
   git config --global core.editor "notepad++"
   ```

---

## 📂 Git Repository Initialization

```bash
mkdir GitDemo
cd GitDemo
git init
```

Verified `.git` folder:
```bash
ls -a
```

---

## 📄 File Creation and Commit

1. Created welcome file:
   ```bash
   echo "Welcome to Git hands-on lab!" > welcome.txt
   ```

2. Verified contents:
   ```bash
   cat welcome.txt
   ```

3. Staged the file:
   ```bash
   git add welcome.txt
   ```

4. Committed with Notepad++:
   ```bash
   git commit
   ```

---

## 📦 Ignoring Unwanted Files with `.gitignore`

### Created test log files:
```bash
echo "log data" > debug.log
mkdir log
echo "test" > log/test.txt
```

### Created `.gitignore` file:
```bash
notepad++ .gitignore
```

Content added:
```
*.log
log/
```

### Staged `.gitignore`:
```bash
git add .gitignore
```

### Verified ignored files:
```bash
git status
```

Confirmed that `debug.log` and `log/` were ignored and not shown in untracked files.

---

## ✅ Final Commit

```bash
git commit
```

Commit message:
```
Initial commit: Added welcome.txt and .gitignore to ignore .log files and log directory
```

---

## 📌 Final Check

```bash
git status
```

Output:
```
nothing to commit, working tree clean
```

---

## ✅ Status: Week 8 Git Lab Completed Successfully