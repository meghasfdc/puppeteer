#!/usr/bin/env sh

sysctl kernel.unprivileged_userns_clone=1
export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start

if [ "$FIREFOX" = "true" ]; then pyenv shell 3.6; pip3 install --user mozdownload; fi
if [ "$FIREFOX" = "true" ]; then rm -rf $FIREFOX_HOME; mozdownload -t daily -d $FIREFOX_HOME/latest.tar.bz --log-level DEBUG; fi
if [ "$FIREFOX" = "true" ]; then cd $FIREFOX_HOME; tar -xvf latest.tar.bz; cd -; ls $FIREFOX_HOME/firefox/firefox; fi
