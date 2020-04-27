#!/bin/sh

PIP=pip3.6

if ! which -s ${PIP} 2>&1 ; then
    echo "${PIP} not installed"
fi

${PIP} install s3cmd

