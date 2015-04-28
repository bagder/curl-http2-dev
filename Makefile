CURLDIR=../curl
CONFIG = sh $(CURLDIR)/curl-config

CC = gcc
#CC = `sh $(CURLDIR)/curl-config --cc`
#CC=g++
LDFLAGS = `sh $(CURLDIR)/curl-config --libs` #-L$$HOME/src/libssh2/lib
LDFLAGS += -L$$HOME/build-nghttp2/lib -lnghttp2
LDFLAGS += -L$$HOME/build-openssl/lib
LDFLAGS += -lpthread
#LIBCURL = -lcurl -L$(CURLDIR)/ares/.libs
LIBCURL = -L$(CURLDIR)/lib/.libs/ -lcurl -L$$HOME/src/c-ares/.libs -lcares -lssh2 -lidn -lrtmp -lssl -lcrypto -ldl
CFLAGS = -I$(CURLDIR)/include -g

http2-client: http2-client.o $(LIBCURL)
	$(CC) -g -o $@ $< $(LIBCURL) $(LDFLAGS)

http2-client.o: http2-client.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f http2-client.o http2-client

$(LIBCURL):
	(cd $(CURLDIR)/lib && make)
