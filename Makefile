# LaTeX Makefile using latexmk

TEXCC		= latexmk
TEXFLAGS	= -pdflua --shell-escape -synctex=1
SOURCE		= $(shell grep -l '\\documentclass' *.tex)
OBJECTS		= $(SOURCE:.tex=.bbl) $(SOURCE:.tex=.pdf) $(SOURCE:.tex=.nav) $(SOURCE:.tex=.snm) $(SOURCE:.tex=.synctex.gz)

default: release

release: $(SOURCE)
	$(TEXCC) $(TEXFLAGS) $(SOURCE)

clean:
	$(TEXCC) -c

reset: clean
	rm -f $(OBJECTS)

watch:
	$(TEXCC) $(TEXFLAGS) $(SOURCE) -pvc -silent -e '$$pdf_previewer=q[xdg-open %S];'
