#!/bin/bash

# -- configure GitHub credentials
git config --global user.name 'ChristopherEeles'
git config --global user.email 'christopher.eeles@outlook.com'

# -- make array of repos needed
repos=(
    'git@github.com:bhklab/PharmacoGx.git' 'git@github.com:bhklab/CoreGx.git'
    'git@github.com:bhklab/RadioGx.git' 'git@github.com:bhklab/ToxicoGx.git'
    'git@github.com:bhklab/survcomp.git' 'git@github.com:bhklab/genefu.git'
    'git@github.com:bhklab/AnnotationGx.git'
)

# -- clone the repos, erroring if it fails
for r in "${repos[@]}"
do
    git clone "$r" || exit 1
done