# Makefile for phoon

BINDIR =	/usr/local/bin
MANDIR =	/usr/local/man/man1

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
	rm -f $(BINDIR)/phoon
	cp phoon $(BINDIR)
	rm -f $(MANDIR)/phoon.1
	cp phoon.1 $(MANDIR)

clean:
	rm -f phoon *.o a.out core
