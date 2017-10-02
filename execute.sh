#!/bin/bash -x
readonly THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")"; pwd)"
readonly REPO_DIR="$THIS_DIR/repos"
readonly BRANCH_NAME="master"

cd "$THIS_DIR"
rm -rf ${REPO_DIR}/*
git config --local user.name greymd
git config --local user.email greengregson@gmail.com

: "Get docker/cli" && {
    _path="docker/cli/master/contrib/completion/zsh/_docker"
    mkdir -p "$REPO_DIR/$(dirname ${_path})"
    curl -L "https://raw.githubusercontent.com/$_path" > "$REPO_DIR/$_path"
}

: "Get docker/compose" && {
    _path="docker/compose/master/contrib/completion/zsh/_docker-compose"
    mkdir -p "$REPO_DIR/$(dirname ${_path})"
    curl -L "https://raw.githubusercontent.com/$_path" > "$REPO_DIR/$_path"
}

git pull origin master

sed -i -r 's/^(LAST UPDATE:).*$/\1'$(date +%F)'/' $THIS_DIR/README.md

git add -A
git commit -m "$(date +%Y%m%d)_auto_commit"
if [ ${?} -eq 0 ]; then
  # If the commit is succeeded, push it to github.
  git push origin $BRANCH_NAME
fi

exit 0
