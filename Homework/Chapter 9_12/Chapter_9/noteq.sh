echo "Hello $USER. we are going to run 'Not Equal'"
echo "Today is $(date)"
echo "Current working directory : $(pwd)"
rm -vf *.o
./noteq ; echo $?
