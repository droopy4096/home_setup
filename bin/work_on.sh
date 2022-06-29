#!/bin/bash
set -e 

WORKTREE_REPO=${WORKTREE_REPO:-.}
cd ${WORKTREE_REPO}

root_tree=$(git worktree list | head -n 1 | awk '{print $1}')
branch=${1:-${BRANCH}}
branch_dir=$(echo ${branch} | tr "/" "_")

existing_branch=$(git worktree list --porcelain | grep -B 2 -xF "branch refs/heads/${branch}" || echo "")
if [ -n "${existing_branch}" ]
then
  existing_path=$(echo ${existing_branch} | awk '/^worktree/ { print $2 }')
  echo "Found existing worktree: ${existing_path}"
  code ${existing_path}
else
  cd ${root_tree} 
  git pull
  worktree_path=${root_tree}.${branch_dir}
  git worktree add ${worktree_path} ${branch}
  echo "Created new worktree: ${worktree_path}"
  code ${worktree_path}
fi

