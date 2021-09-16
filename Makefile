SRC = $(wildcard sheet*.lhs)
RESOURCES = $(SRC:sheet%.lhs=sheet%.pdf) $(SRC:sheet%.lhs=sheet%Dyslexic.pdf) $(SRC:sheet%.lhs=answer%.pdf) $(SRC:sheet%.lhs=answer%Dyslexic.pdf) $(SRC:sheet%.lhs=code%.hs)
latex := texfot --quiet xelatex --shell-escape --interaction=nonstopmode
lhs2TeX := lhs2TeX --poly

all: ${RESOURCES}

code%.hs : sheet%.lhs
	lhs2TeX --code $< | sed 's/^..//' > code$*.hs

answer%.tex : sheet%.lhs *.fmt
	ghc sheet$*.lhs -package random
	$(lhs2TeX) -l "answers=True" $< > answer$*.tex

answer%Dyslexic.tex : sheet%.lhs *.fmt
	ghc sheet$*.lhs -package random
	$(lhs2TeX) -l "answers=True" -l "dyslexic=True" $< > answer$*Dyslexic.tex

sheet%.tex : sheet%.lhs *.fmt
	$(lhs2TeX) $< > $@

sheet%Dyslexic.tex : sheet%.lhs *.fmt
	$(lhs2TeX) -l "dyslexic=True" $< > $@

%.pdf: %.tex *.cls
	$(latex) $*.tex
	@latex_count=5 ;\
	while egrep -s 'undefined references|undefined citations' $*.log && [ $$latex_count -gt 0 ] ;\
	    do \
	      bibtex track ;\
	      echo "Rerunning latex....\n" ;\
	      $(latex) $*.tex ;\
	      latex_count=`expr $$latex_count - 1` ;\
	    done
	rm -f *~ *% *.aux *.bbl *.blg *.log *.toc *.out *.ptb *.tex *.hi *.o

clean:
	rm *.pdf *% *.aux *.bbl *.blg *.log *.toc *.out *.ptb *.hi *.o *.hs
