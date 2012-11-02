# Makefile for phoon

BINDIR =	/usr/bin
MANDIR =	/usr/share/man/man1
INSTALL=	ginstall

DEFINES =	-DOS_BSD
#DEFINES =	-DOS_SYSV

CC =		gcc
CFLAGS =	-O $(DEFINES)

LDFLAGS =	-s


all:		phoon

phoon:		phoon.o date_parse.o astro.o
	$(CC) $(LDFLAGS) -o phoon phoon.o date_parse.o astro.o -lm

.c.o:
	$(CC) $(CFLAGS) -c $<

date_parse.o:	date_parse.h
astro.o:	astro.h

install:	all
	$(INSTALL) -D phoon $(DESTDIR)$(BINDIR)/phoon
	$(INSTALL) -D phoon.1 $(DESTDIR)$(MANDIR)/phoon.1

clean:
	rm -f phoon *.o a.out core
