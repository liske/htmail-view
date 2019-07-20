htmail-view
===========

About
-----

Web page renderer based on WebKit2. In contrast to a ordenary WebKit2-based
browser, *htmail-view* will prevent loading remote content while showing
a single web page (i.e. from a local file).

It was written to be called from *mutt* to view HTML mails. It tries to
protect the users privacy by not loading remote resources. The default
browser will be used if the user follows a link.


Prerequisites
-------------

- Gtk3 gir bindings
- WebKit2 gir bindings
- Perl packages
  - Browser::Open
  - Glib::Object::Introspection
  - URI
- wmctrl (optional; used by wmctrl-wrapper)


Installation
------------

*htmail-view* is a self-contained perl script. On *Debian GNU/Linux* you
could use the prepared **.deb** packages (see github releases).


Usage
-----


### Mutt


`~/.muttrc`
```ini
# prefer plain text
alternative_order text/plain text/enriched text/html

# auto convert text/html MIME type to text/plain
auto_view text/html

# run viewer defined in mailcap by <return> in attach view
bind attach <return> view-mailcap

# mailcap file to use (optional)
set mailcap_path="~/.mutt/mailcap"


# handover mail to htmail-view (works only for multipart mails containing text/html payload)
macro index,pager H "<pipe-message>htmail-decode<return>" "render html mail using htmail-view"
```

The Debian package will aready add an entry to the global mailcap file.


#### Use htmail-view for text/html parts

`mailcap`
```bash
text/html; htmail-view file://%s; test=test -n "$DISPLAY"; nametemplate=%s.html; needsterminal;
text/html; w3m -I %{charset} -T text/html; copiousoutput;
```


#### Use wmctrl wrapper (focus handling)

The wrapper will save the window id of the currently focused window **before**
*htmail-view* is launched. After *htmail-view* has been terminated it will try
to restore the focused window.

`mailcap`
```bash
text/html; /usr/lib/htmail-view/wmctrl-wrapper file://%s; test=test -n "$DISPLAY"; nametemplate=%s.html; needsterminal;
text/html; w3m -I %{charset} -T text/html; copiousoutput;
```
