# Makefile
all: comfor

load: comfor.o
     gcc -o $@ $+

comfor.o : comfor.s
     as -o $@ $<

clean:
     rm -vf *.o
