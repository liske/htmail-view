calmium
=======

About
-----

Web page renderer based on WebKit. In contrast to a ordenary WebKit-based
browser, *calmium* will prevent loading remote content while showing
a single web page (i.e. from a local file).

It was written to be called from *mutt* to view HTML mails. It tries to
protect the users privacy by not loading remote resources. The default
browser will be used if the user follows a link.


Prerequisites
-------------

- Gtk3 gir bindings
- WebKit gir bindings
- Perl packages
 - Browser::Open
 - Glib::Object::Introspection
 - URI


Installation
------------

TBD

