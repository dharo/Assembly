echo "Hello $USER. we are going to run 'compare'"
echo "Today is $(date)"
echo "Current working directory : $(pwd)"
rm -vf *.o
./compare ; echo $?
