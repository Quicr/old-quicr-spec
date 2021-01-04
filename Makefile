
all: gen/design.pdf 


gen/design.pdf: design.md
	pandoc -s design.md -o gen/design.pdf

