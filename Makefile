PREFIX = /usr
MANDIR = $(PREFIX)/share/man
branch=$(shell git rev-parse --abbrev-ref HEAD)
all:
	@echo "Run sudo make install to install nexfetch (from this folder)".
	@echo "Run sudo make lastinstall to install from latest tag (including pre-releases)".

lastinstall:
	@git stash save .
	@git fetch --all --tags
	@git checkout $(shell git describe --tags `git rev-list --tags --max-count=1`)
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@cp -p nexfetch $(DESTDIR)$(PREFIX)/bin/nexfetch
	@cp -p nexfetch.1 $(DESTDIR)$(MANDIR)/man1
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/nexfetch
	@git switch $(branch)
	@git stash pop
	
install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@cp -p nexfetch $(DESTDIR)$(PREFIX)/bin/nexfetch
	@cp -p nexfetch.1 $(DESTDIR)$(MANDIR)/man1
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/nexfetch

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/nexfetch
	@rm -rf $(DESTDIR)$(MANDIR)/man1/nexfetch.1*
