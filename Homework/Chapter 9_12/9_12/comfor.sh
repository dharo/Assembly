echo "Hello $USER. we are going to run Compare forward"
echo "Today is $(date)"
echo "Current working directory : $(pwd)"
rm -vf *.o
./comfor ; echo $?
