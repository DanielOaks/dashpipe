# Copyright (c) 2013, Daniel Oaks, under 2-clause BSD license.

COMMAND=dashpipe
PREFIX=/usr
BIN=/bin
DATA=/share
MAN=$(DATA)/man/man1
LICENSES=$(DATA)/licenses

all: man

man:
	pod2man README.pod > $(COMMAND).1 --release="dashpipe 1.0.2" --center="Pony Utilities" --name="DASHPIPE" --section=1


install:
	mkdir -p "$(DESTDIR)$(PREFIX)$(BIN)"
	install -Dm755 "$(COMMAND)" "$(DESTDIR)$(PREFIX)$(BIN)/$(COMMAND)"
	mkdir -p "$(DESTDIR)$(PREFIX)$(MAN)"
	install -Dm644 "$(COMMAND).1" "$(DESTDIR)$(PREFIX)$(MAN)/$(COMMAND).1"
	mkdir -p "$(DESTDIR)$(PREFIX)$(LICENSES)/$(COMMAND)"
	install -Dm644 "COPYING" "$(DESTDIR)$(PREFIX)$(LICENSES)/$(COMMAND)/COPYING"


uninstall:
	rm -- "$(DESTDIR)$(PREFIX)$(BIN)/$(COMMAND)"
	rm -- "$(DESTDIR)$(PREFIX)$(MAN)/$(COMMAND).1"
	rm -r -- "$(DESTDIR)$(PREFIX)$(LICENSES)/$(COMMAND)"


clean:
	rm -r *.1
