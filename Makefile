#
#	Build usable docs
#

ASCIIDOCTOR = asciidoctor
OSPS_SPEC = riscv-osps
PANDOC = pandoc
PARTS = \
	contributors.adoc history.adoc licensing.adoc \
	references.adoc terms.adoc
TODO = TODO

.PHONY = todo

# Build the OSPS
all: $(OSPS_SPEC).md $(OSPS_SPEC).pdf $(OSPS_SPEC).html

$(OSPS_SPEC).md: $(OSPS_SPEC).xml
	$(PANDOC) -f docbook -t markdown_strict $< -o $@ 

$(OSPS_SPEC).xml: $(OSPS_SPEC).adoc
	$(ASCIIDOCTOR) -d book -b docbook $<

$(OSPS_SPEC).pdf: $(OSPS_SPEC).adoc
	$(ASCIIDOCTOR) -d book -r asciidoctor-pdf -b pdf $<

$(OSPS_SPEC).html: $(OSPS_SPEC).adoc
	$(ASCIIDOCTOR) -d book -b html $<

$(OSPS_SPEC).adoc: $(PARTS)
	touch $@

# Build the TODO list
todo: $(TODO).md $(TODO).pdf $(TODO).html

$(TODO).md: $(TODO).xml
	$(PANDOC) -f docbook -t markdown_strict $< -o $@ 

$(TODO).xml: $(TODO).adoc
	$(ASCIIDOCTOR) -b docbook $<

$(TODO).pdf: $(TODO).adoc
	$(ASCIIDOCTOR) -r asciidoctor-pdf -b pdf $<

$(TODO).html: $(TODO).adoc
	$(ASCIIDOCTOR) -b html $<

clean:
	rm -f $(OSPS_SPEC).xml
	rm -f $(OSPS_SPEC).md
	rm -f $(OSPS_SPEC).pdf
	rm -f $(OSPS_SPEC).html
	rm -f $(TODO).xml
	rm -f $(TODO).md
	rm -f $(TODO).pdf
	rm -f $(TODO).html

install-debs:
	sudo apt-get install pandoc asciidoctor ruby-asciidoctor-pdf

install-rpms:
	sudo dnf install pandoc rubygem-asciidoctor rubygem-asciidoctor-pdf

