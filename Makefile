all:

install: all
	mkdir -p "$(DESTDIR)/usr/bin"
	cp htmail-decode "$(DESTDIR)/usr/bin/"
	cp htmail-view "$(DESTDIR)/usr/bin/"
	mkdir -p "$(DESTDIR)/usr/lib/htmail-view"
	cp wmctrl-winid "$(DESTDIR)/usr/lib/htmail-view/"
	cp wmctrl-wrapper "$(DESTDIR)/usr/lib/htmail-view/"

clean:
