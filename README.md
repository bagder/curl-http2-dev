# curl-http2-dev
curl http2 development test tools and applications

Requires a curl build from the curl repo, the `http2-multiplex` branch.

Requires that you have a recent nghttp2 built and installed, including its
servers (configure --enable-apps)

# step-by-step

1. edit the Makefile in this directory

2. invoke make

3. start the server in a separate shell './run-nghttp2.sh'

4. invoke the test application ./run-test.sh

5. investigate 'dump' after the test as completed

6. To generate a new set of cert + key for the test server, run ./setup.sh
