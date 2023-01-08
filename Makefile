#!/usr/bin/env bash
PREFIX = /usr
MANDIR = $(PREFIX)/share/man
branch=$(shell git rev-parse --abbrev-ref HEAD)
all:
	echo "Run make install to install nexfetch (from this folder)".
	echo "Run make lastinstall to install from latest tag (including pre-releases)".

lastinstall:
	@git stash save .
	@git fetch --all --tags
	@git checkout $(shell git describe --tags `git rev-list --tags --max-count=1`)
	@sudo mkdir -p $(DESTDIR)$(PREFIX)/bin
	@sudo mkdir -p $(DESTDIR)$(MANDIR)/man1
	@sudo cp -p nexfetch $(DESTDIR)$(PREFIX)/bin/nexfetch
	@sudo cp -p nexfetch.1 $(DESTDIR)$(MANDIR)/man1
	@sudo chmod 755 $(DESTDIR)$(PREFIX)/bin/nexfetch;
	@git switch $(branch)
	@git stash pop
	
install:
	@sudo mkdir -p $(DESTDIR)$(PREFIX)/bin
	@sudo mkdir -p $(DESTDIR)$(MANDIR)/man1
	@sudo cp -p nexfetch $(DESTDIR)$(PREFIX)/bin/nexfetch
	@sudo cp -p nexfetch.1 $(DESTDIR)$(MANDIR)/man1
	@sudo chmod 755 $(DESTDIR)$(PREFIX)/bin/nexfetch