#!/bin/bash

pushd $(dirname $0)>/dev/null

chmod u+x ~/.vim/.git/hooks/post-merge

popd > /dev/null
