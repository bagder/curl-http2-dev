#!/bin/sh

./http2-client 22 >dump 2>&1

echo $?
