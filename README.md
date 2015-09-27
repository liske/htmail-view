htmail-view
===========

About
-----

Web page renderer based on WebKit. In contrast to a ordenary WebKit-based
browser, *htmail-view* will prevent loading remote content while showing
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

*htmail-view* is a self-contained perl script. On *Debian GNU/Linux* you could use the prepared **.deb** packages (see github releases).


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


#### Use htmail-view for text/html parts

`~/.mutt/mailcap`
```bash
text/html; htmail-view file://%s; test=test -n "$DISPLAY"; nametemplate=%s.html; needsterminal;
text/html; w3m -I %{charset} -T text/html; copiousoutput;
```


#### Use wmctrl wrapper (focus handling)

`~/.mutt/mailcap`
```bash
text/html; /usr/lib/htmail-view/wmctrl-wrapper file://%s; test=test -n "$DISPLAY"; nametemplate=%s.html; needsterminal;
text/html; w3m -I %{charset} -T text/html; copiousoutput;
```
