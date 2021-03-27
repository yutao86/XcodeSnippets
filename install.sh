#!/bin/bash

XCODE_USERDATA=~/Library/Developer/Xcode/UserData/
NAME=CodeSnippets
TEMP_NAME=_CodeSnippets

# 1.检查文件夹
if [ ! -d "${XCODE_USERDATA}" ]; then
	echo "Folder ${XCODE_USERDATA} not found." >&2
	exit -1
fi

# 2.克隆到临时文件夹
cd "${XCODE_USERDATA}" 
rm -rf "${TEMP_NAME}"
git clone "git@github.com:yutao86/${NAME}.git" "${TEMP_NAME}"

if [ $? -eq 0 ] 
then
	echo "Cloned repository successfully."
else 
	echo "Failed to clone repository." >&2 
	exit -1
fi

# 3.替换到目标文件夹
rm -rf "${NAME}"
mv "${TEMP_NAME}" "${NAME}"

if [ $? -eq 0 ] 
then
	echo "Installed code snippets successfully."
else 
	echo "Failed to replace code snippets folder." >&2 
	exit -1
fi