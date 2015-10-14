# Makefile
all: compare

compare: compare.o
     gcc -o $@ $+

compare.o : compare.s
     as -o $@ $<

clean:
     rm -vf *.o
