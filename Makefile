CFLAGS = -g -Wall -std=gnu11
LDFLAGS =
LDLIBS =
YACC = lemon/lemon
YFLAGS = -m -q
LEX = flex
LFLAGS = --header-file=src/lexer.h
MKHEADERS = makeheaders/makeheaders

.PHONY: all lemon makeheaders clean dist-clean

all: parser.h

parser.c: parser.y lemon
	$(YACC) $(YFLAGS) $<

parser.h: parser.c makeheaders
	$(MKHEADERS) $<

lemon:
	@make -C lemon

makeheaders:
	@make -C makeheaders

style:
	astyle -A3s4SpHk3jnr "*.c" "*.h"

clean:
	rm -f parser.c parser.hw

dist-clean:
	@make clean
	@make -C lemon clean
	@make -C makeheaders clean
