# Git-T03-HOL_001: Merge Conflict Resolution

## ✅ Objectives

- Learn how to resolve merge conflicts in Git.
- Simulate a conflict scenario between master and a feature branch (`GitWork`).
- Resolve the conflict using a manual 3-way merge.
- Clean up after the merge.

---

## 🧰 Prerequisites

- Git installed
- Git Bash or any terminal
- (Optional) P4Merge or any 3-way merge tool

---

## 🕒 Estimated Time

30 minutes

---

## 🔧 Steps

### 1. Create a new directory and initialize a Git repo

```bash
mkdir GitConflictDemo2
cd GitConflictDemo2
git init
```

### 2. Create hello.xml and commit to master

```bash
echo "<greeting>Hello from master</greeting>" > hello.xml
git add hello.xml
git commit -m "Initial commit in master with hello.xml"
```

### 3. Create a new branch GitWork and modify hello.xml

```bash
git checkout -b GitWork
echo "<greeting>Hello from GitWork branch</greeting>" > hello.xml
git add hello.xml
git commit -m "Changed hello.xml in GitWork"
```

### 4. Switch to master and modify hello.xml differently

```bash
git checkout master
echo "<greeting>Hello again from master branch</greeting>" > hello.xml
git add hello.xml
git commit -m "Changed hello.xml again in master"
```

### 5. Merge GitWork into master to trigger a conflict

```bash
git merge GitWork
```

### 6. Observe conflict markers in hello.xml

```xml
<<<<<<< HEAD
<greeting>Hello again from master branch</greeting>
=======
<greeting>Hello from GitWork branch</greeting>
>>>>>>> GitWork
```

### 7. Resolve conflict manually

Edit hello.xml and remove conflict markers. Example resolved version:

```xml
<greeting>Hello again from master branch</greeting>
<greeting>Hello from GitWork branch</greeting>
```

### 8. Commit the resolved file

```bash
git add hello.xml
git commit -m "Resolved conflict in hello.xml"
```

### 9. Ignore backup files if created

```bash
echo "hello.xml.orig" >> .gitignore
git add .gitignore
git commit -m "Added hello.xml.orig to .gitignore"
```

### 10. Delete the GitWork branch after successful merge

```bash
git branch -d GitWork
```

### 11. View final log

```bash
git log --oneline --graph --decorate
```

---

## ✅ Outcome

You now understand how to:
- Simulate a Git conflict
- Resolve it using manual editing
- Clean up with `.gitignore`
- Visualize the Git history with graph