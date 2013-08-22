
durations=""

RCHOME=`dirname $0`
for rcfile in $RCHOME/*.rc
do
  [ -n "$BENCHTIME" ] && start=`date +%s.%N`
  if [ -f $rcfile ]; then
    source $rcfile
  elif [ -h $rcfile && readlink -e $rcfile ]; then
    source $rcfile
  fi
  if [ -n "$BENCHTIME" ]; then
    end=`date +%s.%N`
    duration=`nanodiff $start $end`
    durations="$durations $duration \t$rcfile\n"
  fi
done
echo $PWD > /dev/shm/$$.cwd
if [ -n "$BENCHTIME" ]; then
  echo -e $durations|sort -n
fi
