
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
    durations="$durations `print_with_thousands_grouping $duration` $rcfile\n"
  fi
done
SHM_DIR=
if [ -d /dev/shm ]; then
  SHM_DIR=/dev/shm
  export SHM_DIR
  echo $PWD > /dev/shm/$$.cwd
fi
if [ -z "$BENCHTIME_DONE" ]; then
  echo -e $durations|sort -n
fi
