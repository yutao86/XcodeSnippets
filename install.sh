#!/bin/bash

REPO_NAME=XcodeSnippets
LOCAL_REPO_PATH=~/.XcodeSnippets
SNIPPETS_PATH=~/Library/Developer/Xcode/UserData/CodeSnippets

rm -rf "${LOCAL_REPO_PATH}"

echo  "Cloning repo to ${LOCAL_REPO_PATH}..."
git clone "git@github.com:yutao86/${REPO_NAME}.git" "${LOCAL_REPO_PATH}"
if [ $? -eq 0 ]; then
	echo "Repository cloned."
else 
	echo "Failed to clone repository." >&2 
	exit -1
fi

echo  "Linking ${SNIPPETS_PATH} to ${LOCAL_REPO_PATH}..."
rm -rf "${SNIPPETS_PATH}"
ln -s "${LOCAL_REPO_PATH}" "${SNIPPETS_PATH}"

echo  "Done."