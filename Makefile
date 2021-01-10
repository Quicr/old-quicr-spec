
all: gen/quicr-spec.pdf 

clean:
	rm -rf gen/*


gen/quicr-spec.pdf: quicr-spec.md
	pandoc -s quicr-spec.md -o gen/quicr-spec.pdf

