all: doc_html

doc_html: html-stamp

html-stamp: setup
	asciidoc -a toc -a numbered setup
	touch html-stamp

clean:
	rm -rf html-stamp setup.html

online: doc_html
	scp setup.html grml:/var/www/grml/infrastructure/index.html

distclean:
	rm -rf setup.html html-stamp
