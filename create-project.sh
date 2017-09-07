#!/bin/bash

PROJECT=$1

green="\033[38;5;10m"
yellow="\033[38;5;11m"
red="\033[31;5;11m"
clean="\033[m"

[ ! $PROJECT ] && \
  echo -e "${yellow}usage:\n\t$0 Project-Name${clean}\n" && \
    exit 1

[ -d $PROJECT ] && \
  echo -e "${red}Dir '$PROJECT' allready exists${clean}\n" && \
    chmod -R a+rwX $PROJECT && \
      exit 1

echo -e "${green} creating project '$PROJECT' ... ${clean}"

swagger project create -f restify $PROJECT && \
  cd $PROJECT && \
    npm i -S restify-jwt && \
      chmod -R a+rwX ../$PROJECT || \
        exit 1

echo -e "${green}done${clean}\n"
