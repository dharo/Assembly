# Makefile
all: equal
 
equal: equal.o
	gcc -o $@ $+
 
equal.o : equal.s
	as -o $@ $<

clean:
	rm -vf *.o
