# GitDemo - Week 8 Exercise 3: Branching and Merging

This hands-on exercise demonstrates how to create a Git branch, perform changes, and merge it back into the master branch. It also introduces how to use visual merge tools like P4Merge.

---

## ✅ Objectives
- Create and switch between Git branches
- Perform commits in a new branch
- Merge the branch into master
- Use CLI and (optionally) visual diff tools
- Delete merged branches

---

## 🛠️ Step-by-Step Instructions

### 🔁 Branching

1. Ensure you are in your Git repo folder (e.g., `GitDemo`)
2. Commit initial file:
    ```bash
    git commit
    ```
3. Create a new branch:
    ```bash
    git branch GitNewBranch
    ```
4. Switch to the branch:
    ```bash
    git checkout GitNewBranch
    ```
5. Create a file:
    ```bash
    echo "This is a new feature file" > feature.txt
    git add feature.txt
    git commit -m "Added feature.txt in GitNewBranch"
    ```
6. Verify:
    ```bash
    git status
    ```

---

### 🔄 Merging

1. Switch back to master:
    ```bash
    git checkout master
    ```

2. See CLI diff:
    ```bash
    git diff GitNewBranch
    ```

3. (Optional) Use P4Merge:
    ```bash
    git config --global diff.tool p4merge
    git config --global merge.tool p4merge
    git difftool GitNewBranch
    ```

4. Merge:
    ```bash
    git merge GitNewBranch
    ```

5. View commit graph:
    ```bash
    git log --oneline --graph --decorate
    ```

6. Delete the branch:
    ```bash
    git branch -d GitNewBranch
    ```

---

## 🌐 GitLab Merge Request (Optional)

```bash
git push origin GitNewBranch
