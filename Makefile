USE_GEOIP?=no
USE_MAXMIND?=yes
USE_RUNTIME_LINKING?=yes

LIBPATH?=/usr/lib64
#LIBPATH=/usr/lib/x86_64-linux-gnu

LIBS?=
VERSION=$(shell cat meson.build|grep 'version :'|cut -d ':' -f 2|tr -d " \'")
CC?=gcc
CFLAGS?=-O2 -g -Wall
LDFLAGS=$(LIBS)

ifeq ($(USE_GEOIP),yes)
ifeq ($(USE_RUNTIME_LINKING),yes)
LDFLAGS+=-ldl
CFLAGS+=-DUSE_GEOIP -DUSE_RUNTIME_LINKING -DLIBPATH="\"$(LIBPATH)\""
else
LDFLAGS+=-lGeoIP
CFLAGS+=-DUSE_GEOIP
endif # DYN GEOIP
else  # GEOIP
ifeq ($(USE_MAXMIND),yes)
ifeq ($(USE_RUNTIME_LINKING),yes)
LDFLAGS+=-ldl
CFLAGS+=-DUSE_MAXMIND -DUSE_RUNTIME_LINKING -DLIBPATH="\"$(LIBPATH)\""
else
LDFLAGS+=-lmaxminddb
CFLAGS+=-DUSE_MAXMIND
endif # DYN MAXMIND
endif # MAXMIND
endif # not GEOIP

all: ipcalc

ipcalc: ipcalc.c ipv6.c deaggregate.c ipcalc-geoip.c ipcalc-maxmind.c ipcalc-reverse.c ipcalc-utils.c netsplit.c
	$(CC) $(CFLAGS) -DVERSION="\"$(VERSION)\"" $^ -o $@ $(LDFLAGS)

clean:
	rm -f ipcalc
