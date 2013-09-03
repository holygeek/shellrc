
durations=""

RCHOME=`dirname $0`
for rcfile in $RCHOME/*.rc
do
  [ -z "$BENCHTIME_DONE" ] && start=`date +%s.%N`
  if [ -f $rcfile ]; then
    source $rcfile
  elif [ -h $rcfile && readlink -e $rcfile ]; then
    source $rcfile
  fi
  if [ -z "$BENCHTIME_DONE" ]; then
    end=`date +%s.%N`
    duration=`nanodiff $start $end`
    durations="$durations $duration \t$rcfile\n"
  fi
done
echo $PWD > /dev/shm/$$.cwd
if [ -z "$BENCHTIME_DONE" ]; then
  echo -e $durations|sort -n
fi
