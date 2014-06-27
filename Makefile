TITLE=$(shell grep docName template.xml | sed -e 's/.*docName=\"//' -e 's/\">//')

.PHONY: txt clean

all: txt

txt: $(TITLE).txt

draft.txt: *.mkd
	pandoc2rfc *.mkd

$(TITLE).txt:	draft.txt
	ln -sf $< $@

draft.xml: *.mkd
	pandoc2rfc -X *.mkd

draft.html: *.mkd
	pandoc2rfc -H *.mkd


clean:
	rm -f *.txt 
