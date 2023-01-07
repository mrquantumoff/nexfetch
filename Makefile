PREFIX = /usr
MANDIR = $(PREFIX)/share/man

all:
	@echo Run \'make install\' to install nexfetch.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@cp -p nexfetch $(DESTDIR)$(PREFIX)/bin/nexfetch
	@cp -p nexfetch.1 $(DESTDIR)$(MANDIR)/man1
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/nexfetch

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/nexfetch
	@rm -rf $(DESTDIR)$(MANDIR)/man1/nexfetch.1*
