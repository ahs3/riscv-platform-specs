#
#	Build usable docs
#

ASCIIDOCTOR = asciidoctor
PANDOC = pandoc
PLATFORM_SPEC = riscv-unix

all: $(PLATFORM_SPEC).md $(PLATFORM_SPEC).pdf $(PLATFORM_SPEC).html

$(PLATFORM_SPEC).md: $(PLATFORM_SPEC).xml
	$(PANDOC) -f docbook -t markdown_strict $< -o $@ 

$(PLATFORM_SPEC).xml: $(PLATFORM_SPEC).adoc
	$(ASCIIDOCTOR) -b docbook $<

$(PLATFORM_SPEC).pdf: $(PLATFORM_SPEC).adoc
	$(ASCIIDOCTOR) -r asciidoctor-pdf -b pdf $<

$(PLATFORM_SPEC).html: $(PLATFORM_SPEC).adoc
	$(ASCIIDOCTOR) -b html $<

clean:
	rm -f $(PLATFORM_SPEC).xml
	rm -f $(PLATFORM_SPEC).md
	rm -f $(PLATFORM_SPEC).pdf
	rm -f $(PLATFORM_SPEC).html

install-pkgs:
	sudo apt-get install pandoc asciidoctor ruby-asciidoctor-pdf

