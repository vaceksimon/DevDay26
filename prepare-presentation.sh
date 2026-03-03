#!/bin/bash
set -e

KC_REPO="$HOME/Work/repos/DevDay26"
alias git='git --git-dir="$KC_REPO/.git/" --work-tree="$KC_REPO/"'

WORK_BRANCH=devday
INIT_BRANCH=start

shopt -s expand_aliases
git restore --worktree --staged "$KC_REPO"
git checkout main
git branch --delete --force "$WORK_BRANCH"
git checkout "$INIT_BRANCH"
git checkout -b "$WORK_BRANCH"
shopt -u expand_aliases

