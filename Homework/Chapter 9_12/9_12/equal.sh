echo "Hello $USER. We are going to run 'equal'"
echo "Today is $(date)"
echo "Current working directory: $(pwd)"
rm -vf *.o
./equal ; echo $?
