# -*- Makefile -*-
SHELL = /bin/sh
EMACS ?= emacs

.PHONY: deps clean test compile

EMACS_BATCH_OPTS=--batch -Q -l mybigword.el

RM = @rm -rf

clean:
	$(RM) *~
	$(RM) \#*\#
	$(RM) *.elc

compile: clean
	@$(EMACS) $(EMACS_BATCH_OPTS) -l tests/my-byte-compile.el 2>&1 | grep -E "([Ee]rror|[Ww]arning):" && exit 1 || exit 0

test: compile
	@echo "Test is done"