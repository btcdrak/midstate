CC = gcc
CFLAGS = -march=native -Wall -funroll-all-loops -O3 -fstrict-aliasing -Wall -std=c99 -I/usr/include/python3.2
LDFLAGS = -Wl,-O1 -Wl,--as-needed -lpython3.2

all: test midstate.so

test: midstatemodule.c
	$(CC) $(CFLAGS)  midstatemodule.c -o test $(LDFLAGS)

midstate.so: midstatemodule.c
	$(CC) $(CFLAGS) -fPIC -shared midstatemodule.c -o midstate.so $(LDFLAGS)

.PHONY: clean

clean:
	rm -f midstate.so test
