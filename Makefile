all: security_patterns.pdf

security_patterns.pdf: security_patterns.tex
	ls __src/chapters/*.tex | grep -v __all__.tex | awk '{printf "\\input{%s}\n", $$1}' > __src/chapters/__all__.tex
	latexmk -pdf -pdflatex="pdflatex --shell-escape" -use-make security_patterns.tex
	latexmk -c

clean:
	latexmk -CA
	rm __src/chapters/__all__.tex
	find __src/svg -name "*.pdf" -delete
	find __src/svg -name "*.pdf_tex" -delete

