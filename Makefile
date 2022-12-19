# -*- Makefile -*-
SHELL = /bin/sh
EMACS ?= emacs

.PHONY: deps clean test compile

EMACS_BATCH_OPTS=--batch -Q

RM = @rm -rf

clean:
	$(RM) *~
	$(RM) \#*\#
	$(RM) *.elc

deps:
	@mkdir -p deps;
	@if [ ! -f deps/avy.el ]; then curl -L https://raw.githubusercontent.com/abo-abo/avy/master/avy.el > deps/avy.el; fi;

compile: clean deps
	@$(EMACS) $(EMACS_BATCH_OPTS) -l deps/avy.el -l mybigword.el -l tests/my-byte-compile.el 2>&1 | grep -E "([Ee]rror|[Ww]arning):" && exit 1 || exit 0

test: compile
	@echo "Test is done"