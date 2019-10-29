#!/bin/bash

if [ -f ~/.bash_functions  ]; then
  . ~/.bash_functions
fi

export GITHUB_OAUTH=346671c3b7387c4768113334445e1a0c050c2499

alias grep='grep --color=auto'
alias ls='ls -G'
alias ll='ls -l'
alias slo='curl -sL sentinel.touchtunes.com/api/v1/slo|jq ""'
alias vpn='sudo /usr/local/bin/openconnect --user=hlafleur --servercert sha256:fc8a56daf0b0110a6b94e1733035f42338202f19b90e77cfe1b793e3c83fdae7 --authgroup=TouchTunes --passwd-on-stdin vpn.theoctavegroup.com <<< `cat ~/.vpn/passwd`'

lgp () { curl -s http://logstream.scaffold-masters-prod-us.tsp.cld.touchtunes.com/logs?query=app.prod.$1.*; }
lgs () { curl -s http://logstream.scaffold-masters-staging-us.test.cld.touchtunes.com/logs?query=app.staging.$1.*; }
lgt () { curl -s http://logstream.scaffold-masters-test-us.dev.cld.touchtunes.com/logs?query=app.test.$1.*; }
lgd () { curl -s http://logstream.scaffold-masters-main-us.dev.cld.touchtunes.com/logs?query=app.dev.$1.*; }
