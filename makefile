NAME = xfsudo
VER = 0.6
SHELL = /bin/bash
INSTALL = /usr/bin/install
DESTDIR =
BINDIR = /usr/bin
MANDIR = /usr/man/man8
DOCDIR = /usr/doc/$(NAME)-$(VER)
RM = /usr/bin/rm

all:

install: all
	$(INSTALL) -d $(DESTDIR)$(BINDIR)
	$(INSTALL) -d $(DESTDIR)$(MANDIR)
	$(INSTALL) -d $(DESTDIR)$(DOCDIR)
	$(INSTALL) -m755 bin/xfsudo.sh $(DESTDIR)$(BINDIR)/xfsudo
	$(INSTALL) -m755 bin/xfsudo.sh $(DESTDIR)$(BINDIR)/xfsu
	$(INSTALL) -m644 man/xfsudo.8 $(DESTDIR)$(MANDIR)
	$(INSTALL) -m644 man/xfsudo.8 $(DESTDIR)$(MANDIR)/xfsu.8
	$(INSTALL) -m644 README $(DESTDIR)$(DOCDIR)
	$(INSTALL) -m644 COPYING $(DESTDIR)$(DOCDIR)

uninstall:
	$(RM) $(DESTDIR)$(BINDIR)/xfsudo
	$(RM) $(DESTDIR)$(BINDIR)/xfsu
	$(RM) $(DESTDIR)$(MANDIR)/xfsudo.8
	$(RM) $(DESTDIR)$(MANDIR)/xfsu.8
	$(RM) -r $(DESTDIR)$(DOCDIR)
