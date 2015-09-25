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

*calmium* is a self-contained perl script. On *Debian GNU/Linux* you could use the prepared **.deb** packages (see github releases).


Usage
-----


### Mutt


`~/.muttrc`
```ini
# auto convert text/html MIME type to text/plain
auto_view text/html

# prefer plain text
alternative_order text/plain text/enriched text/html

# run viewer defined in mailcap  by <return> in attach view
bind attach <return> view-mailcap

# mailcap file to use
set mailcap_path="~/.mutt/mailcap"
```

`~/.mutt/mailcap`
```bash
text/html; calmium file://%s; test=test -n "$DISPLAY"; nametemplate=%s.html; needsterminal;
text/html; w3m -I %{charset} -T text/html; copiousoutput;
```
