VERSION := 1.0.0
NAME := encontre

.PHONY: all clean install uninstall deb rpm

all:
	@echo "Use: make install, make deb, ou make rpm"

install:
	install -D -m 755 bin/encontre /usr/local/bin/encontre
	ln -sf /usr/local/bin/encontre /usr/local/bin/encontrar

uninstall:
	rm -f /usr/local/bin/encontre /usr/local/bin/encontrar

clean:
	rm -rf debian/$(NAME)
	rm -rf *.deb *.rpm
	rm -rf rpmbuild

# Criar pacote .deb
deb:
	dpkg-buildpackage -b -uc -us

# Criar pacote .rpm
rpm:
	mkdir -p rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
	tar --exclude='.git' --exclude='*.deb' --exclude='*.rpm' \
	    --exclude='rpmbuild' -czf rpmbuild/SOURCES/$(NAME)-$(VERSION).tar.gz \
	    --transform 's,^,$(NAME)-$(VERSION)/,' *
	rpmbuild --define "_topdir $(PWD)/rpmbuild" \
	         -ba packaging/rpm/$(NAME).spec