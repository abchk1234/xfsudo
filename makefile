SHELL = /bin/bash
INSTALL = /usr/bin/install -c
SED = /bin/sed
DESTDIR =
bindir = /usr/bin
mandir = /usr/share/man/man1/
appdir = /usr/share/xfsudo

all:

install: all
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -d $(DESTDIR)$(mandir)
	$(INSTALL) -d $(DESTDIR)$(appdir)
	$(INSTALL) -m755 bin/xfsudo $(DESTDIR)$(bindir)
	$(INSTALL) -m755 bin/xfsu $(DESTDIR)$(bindir)
	$(INSTALL) -m644 man/xfsudo.1.gz $(DESTDIR)$(mandir)
	$(INSTALL) -m644 man/xfsu.1.gz $(DESTDIR)$(mandir)
	$(INSTALL) -m644 README $(DESTDIR)$(appdir)
	$(INSTALL) -m644 COPYING $(DESTDIR)$(appdir)


