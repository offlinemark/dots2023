#!/bin/bash

git commit -m 'save index'
git stash
git reset --soft HEAD^
