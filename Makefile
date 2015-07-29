all: security_patterns.pdf

security_patterns.pdf: security_patterns.tex
	latexmk -pdf -pdflatex="pdflatex --shell-escape" -use-make security_patterns.tex
	latexmk -c

clean:
	latexmk -CA
	find __src/svg -name "*.pdf" -delete
	find __src/svg -name "*.pdf_tex" -delete

