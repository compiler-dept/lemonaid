BIN = lemonaid

CFLAGS = -g -Wall -std=gnu11
LDFLAGS =
LDLIBS =
YACC = lemon/lemon
YFLAGS = -m -q
LEX = flex
LFLAGS = --header-file=lexer.h
MKHEADERS = makeheaders/makeheaders

SOURCES = lemonaid.c node.c parser.c

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))

.PHONY: all headers lemon makeheaders clean dist-clean

all: $(BIN)

$(BIN): headers $(OBJECTS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJECTS) $(LDLIBS)

parser.c: parser.y lemon
	$(YACC) $(YFLAGS) $<

headers: parser.c makeheaders
	$(MKHEADERS) $(SOURCES)

lemon:
	@make -C lemon

makeheaders:
	@make -C makeheaders

style:
	astyle -A3s4SpHk3jn "*.c"

clean:
	rm -f $(BIN) $(OBJECTS) parser.c *.h

dist-clean:
	@make clean
	@make -C lemon clean
	@make -C makeheaders clean
