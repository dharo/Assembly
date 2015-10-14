# Makefile
all: noteq
 
noteq: noteq.o
    gcc -o $@ $+
 
noteq.o : noteq.s
    as -o $@ $<

clean:
    rm -vf *.o
