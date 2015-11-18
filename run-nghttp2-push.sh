#!/bin/sh

prefix="$HOME/build-nghttp2"
bin="$prefix/bin"

options="--htdocs=. --verbose --echo-upload --push=/index.html=/LICENSE --push=/index.html=/README.md"

$bin/nghttpd $options 8443 privkey.pem server.pem 
