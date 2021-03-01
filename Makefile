
# install xml2rfc with "pip install xml2rfc"
# install mmark from https://github.com/mmarkdown/mmark 
# install pandoc from https://pandoc.org/installing.html
# install lib/rr.war from https://bottlecaps.de/rr/ui or https://github.com/GuntherRademacher/rr

.PHONE: all clean lint format

all: gen/draft-jennings-quicr.txt

clean:
	rm -rf gen/*

lint: gen/draft-jennings-quicr.xml
	rfclint gen/draft-jennings-quicr.xml

format:
	mkdir -p gen
	mmark -markdown quicr-spec.md >  gen/quicr-spec.md
	echo updated MD is in  gen/quicr-spec.md

gen/draft-jennings-quicr.xml: rfc.md abstract.md  quicr-spec.md contributors.md 
	mkdir -p gen
	mmark -w rfc.md > gen/draft-jennings-quicr.xml

gen/draft-jennings-quicr.txt: gen/draft-jennings-quicr.xml
	xml2rfc --text --v3 gen/draft-jennings-quicr.xml

gen/draft-jennings-quicr.pdf: gen/draft-jennings-quicr.xml
	xml2rfc --pdf --v3 gen/draft-jennings-quicr.xml

gen/draft-jennings-quicr.html: gen/draft-jennings-quicr.xml
	xml2rfc --html --v3 gen/draft-jennings-quicr.xml

gen/quicr.pdf: abstract.md  quicr-spec.md contributors.md 
	mkdir -p gen 
	pandoc -s title.md abstract.md  quicr-spec.md contributors.md -o gen/quicr.pdf


gen/diagram.zip: quicr.ebnf
	mkdir -p gen 
	java -jar lib/rr.war -png -noinline -color:#FFFFFF -out:gen/digram.zip quicr.ebnf
	unzip -o gen/digram.zip
	mv index.html quicr-gramar.html


