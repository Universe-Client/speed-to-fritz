#!/bin/bash
#-#Wrote this cuz im lazy :^)
# Prompt for the file(s) to add
read -p "Enter the file(s) you want to add (use space to separate multiple files): " files

# Prompt for the commit message
read -p "Enter the commit message: " commit_msg

# Prompt for the branch name
read -p "Enter the branch name: " branch

# Add the specified file(s) to the staging area
git add $files

# Commit the changes with the specified commit message
git commit -m "$commit_msg"

# Push the commit to the specified branch
git push origin $branch

echo "Changes have been pushed to $branch."
