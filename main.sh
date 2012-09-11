RCHOME=`dirname $0`
for rcfile in $RCHOME/*.rc
do
  source $rcfile
done
