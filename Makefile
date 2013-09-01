# Copyright (c) 2013, Daniel Oaks, under 2-clause BSD license.

COMMAND=dashpipe
PREFIX=/usr
BIN=/bin
DATA=/share
MAN=$(DATA)/man/man1
LICENSES=$(DATA)/licenses

all: man

man:
	pod2man README.pod > $(COMMAND).1 --release="dashpipe" --center="Pony Utilities" --name="DASHPIPE" --section=1


install:
	install -Dm755 "$(COMMAND)" "$(PREFIX)$(BIN)/$(COMMAND)"
	install -Dm644 "$(COMMAND).1" "$(PREFIX)$(MAN)/$(COMMAND).1"
	mkdir -p "$(PREFIX)$(LICENSES)/$(COMMAND)"
	install -Dm644 "COPYING" "$(PREFIX)$(LICENSES)/$(COMMAND)/COPYING"


uninstall:
	rm -- "$(PREFIX)$(BIN)/$(COMMAND)"
	rm -- "$(PREFIX)$(MAN)/$(COMMAND).1"
	rm -r -- "$(PREFIX)$(LICENSES)/$(COMMAND)"


clean:
	rm -r *.1
