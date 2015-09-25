all:

install: all
	mkdir -p "$(DESTDIR)/usr/bin"
	cp calmium "$(DESTDIR)/usr/bin/"

clean:
