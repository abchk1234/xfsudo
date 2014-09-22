NAME = xfsudo
VER = 0.5
SHELL = /bin/bash
INSTALL = /usr/bin/install
SED = /bin/sed
DESTDIR =
BINDIR = /usr/bin
MANDIR = /usr/man/man1
DOCDIR = /usr/doc/$(NAME)-$(VER)
CONDIR = /etc

all:

install: all
	$(INSTALL) -d $(DESTDIR)$(BINDIR)
	$(INSTALL) -d $(DESTDIR)$(MANDIR)
	$(INSTALL) -d $(DESTDIR)$(DOCDIR)
	$(INSTALL) -d $(DESTDIR)$(CONDIR)
	$(INSTALL) -m755 bin/xfsudo $(DESTDIR)$(BINDIR)
	$(INSTALL) -m644 etc/xfsudo.conf $(DESTDIR)$(CONDIR)
	$(INSTALL) -m644 man/xfsudo.1 $(DESTDIR)$(MANDIR)
	$(INSTALL) -m644 README $(DESTDIR)$(DOCDIR)
	$(INSTALL) -m644 COPYING $(DESTDIR)$(DOCDIR)


