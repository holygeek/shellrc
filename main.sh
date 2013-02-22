RCHOME=`dirname $0`
for rcfile in $RCHOME/*.rc
do
  if [ -f $rcfile ]; then
    source $rcfile
  elif [ -h $rcfile && readlink -e $rcfile ]; then
    source $rcfile
  fi
done
echo $PWD > /dev/shm/$$.cwd
