#!/usr/bin/env bash

export PATH="$PATH:/Users/damian/flutter/bin"

printf 'Pre-Commit'

# Undo the stash of the files
pop_stash_files () {
    if [ -n "$hasChanges" ]; then
        printf '=== Applying git stash changes ==='
        git stash pop
    fi
}

# Stash unstaged files
hasChanges=$(git diff)
if [ -n "$hasChanges" ]; then
    printf 'Stashing unstaged changes'
    git stash push --keep-index
fi

# Flutter formatter
printf '=== Running Flutter Formatter ==='
dart format .

hasNewFilesFormatted=$(git diff)
if [ -n "$hasNewFilesFormatted" ]; then
    git add .
    printf 'Formmated files added to git stage'
fi
printf 'Finished running Flutter Formatter'
printf "${avar}"

# Flutter Analyzer
printf '=== Running Flutter analyzer ==='
flutter analyze
if [ $? -ne 0 ]; then
  printf '=== Flutter analyzer error ==='
  pop_stash_files
  exit 1
fi
printf 'Finished running Flutter analyzer'
printf "${avar}"

# Unit tests
printf '=== Running Unit Tests ==='
flutter test
if [ $? -ne 0 ]; then
  printf '=== Unit tests error ==='
  pop_stash_files
  exit 1
fi
printf 'Finished running Unit Tests'
printf "${avar}"

pop_stash_files
