all: doc_html

doc_html: html-stamp

html-stamp: setup repo-cookbook ml-mmj 
	asciidoc -a toc -a numbered setup
	asciidoc -a toc -a numbered repo-cookbook 
	asciidoc -a toc -a numbered ml-mmj
	touch html-stamp

clean:
	rm -rf html-stamp setup.html \
	       repo-cookbook.html ml-mmj.html 

online: doc_html
	scp setup.html grml:/var/www/grml/infrastructure/index.html

distclean:
	rm -rf setup.html html-stamp
