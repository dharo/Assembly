echo "Compiling Midterm...\n"
gcc -g -o midterm midterm.s prob1.s isp.s fibo.s
echo "Midterm Compiled, executing midterm via command: ./midterm\n\n"
./midterm
