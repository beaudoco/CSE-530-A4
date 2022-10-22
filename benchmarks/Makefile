CC = gcc
LDFLAGS += -lm
CFLAGS += -static

SRCS=$(wildcard *.c)

ASMS=$(SRCS:.c=.s)

OBJS=$(SRCS:.c=)

all: $(OBJS) $(ASMS)

%: %.c
	$(CC) $< $(LDFALGS) $(CFLAGS) -o $@

%.s: %.c
	$(CC) -S $< $(CFLAGS) -o $@

clean:
	rm $(OBJS) $(ASMS)
