all:

install: all
	mkdir -p "$(DESTDIR)/usr/bin"
	cp htmail-view "$(DESTDIR)/usr/bin/"

clean:
