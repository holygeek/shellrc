ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/inputrc ~/.inputrc
ln -s `pwd`/keynavrc ~/.keynavrc
ln -s `pwd`/offlineimaprc ~/.offlineimaprc
if [ ! -e /usr/include/tchdb.h ]; then
  echo "Need libtokyocabinet-dev for mutt's header_cache"
fi

elinks_conf=$HOME/.elinks/elinks.conf
if [ -w $elinks_conf ]; then
  if ! grep -q "include \".*.shell/elinks\.conf\"" $elinks_conf; then
    echo "include \"$HOME/.shell/elinks.conf\"" >> $elinks_conf
  fi
else
    echo "include \"$HOME/.shell/elinks.conf\"" >> $elinks_conf
fi
