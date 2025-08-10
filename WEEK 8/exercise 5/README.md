# Git-T03-HOL_002: Clean Up and Push to Remote Git

## ✅ Objectives

- Verify local Git repository is clean and updated
- Connect to a remote GitHub repository
- Push local commits to the remote repository

---

## 🧰 Prerequisites

- Git installed locally
- A GitHub account (personal)
- A remote repository created on GitHub (e.g., https://github.com/ADINMOHAN/exercise5.git)

---

## 🕒 Estimated Time

10 minutes

---

## 🛠️ Steps

### 1. Verify local `master` branch is in clean state

```bash
git status
```

Expected output:
```
On branch master
nothing to commit, working tree clean
```

---

### 2. List all available branches

```bash
git branch
```

Expected output:
```
* master
```

---

### 3. Remove incorrect origin (if needed)

```bash
git remote remove origin
```

---

### 4. Add correct GitHub remote repository

```bash
git remote add origin https://github.com/ADINMOHAN/exercise5.git
```

Verify with:

```bash
git remote -v
```

---

### 5. Pull remote master to sync (optional)

```bash
git pull origin master --rebase
```

> Note: You might see "fatal: couldn't find remote ref master" — this is okay for a new repo.

---

### 6. Push local code to GitHub

```bash
git push -u origin master
```

Expected output includes:
```
To https://github.com/ADINMOHAN/exercise5.git
* [new branch]      master -> master
branch 'master' set up to track 'origin/master'.
```

---

### 7. Verify on GitHub

Go to: https://github.com/ADINMOHAN/exercise5

You should now see:
- `hello.xml`
- `.gitignore`
- Commit history

---

## ✅ Outcome

- Local Git repository is now in sync with remote GitHub repo
- All changes from previous lab (Git-T03-HOL_001) are pushed to GitHub