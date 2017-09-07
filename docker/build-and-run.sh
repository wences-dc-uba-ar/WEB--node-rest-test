#!/bin/bash -

local_ip=$(ifconfig |grep addr:192.168|cut -d : -f2|cut -d ' ' -f1)
proxy_arg="--build-arg  http_proxy=http://$local_ip:3142/"
# proxy_env="--env http_proxy=http://$local_ip:3142/"
tagname=$(basename $(dirname $(pwd)))
PROJECT=project-example

cmds=()
# build command
cmds+=("docker build $proxy_arg --tag $tagname . ")

# run command
cmds+=("docker run -it --rm -p 80:3000 \
  --mount type=bind,source=$(pwd)/../,target=/app \
  --env PROJECT=$PROJECT \
  $tagname")

# exec commands:
green="\033[38;5;10m"
yellow="\033[38;5;11m"
red="\033[31;5;11m"
clean="\033[m"

for cmd in "${cmds[@]}"; do
  echo -e "\n${yellow}$cmd${clean}\n"
  eval $cmd
  if [ $? != 0 ] ; then
    echo -e "\n${red}fallo ejecutando:${clean} ${yellow}$cmd${clean}\n"
    exit 1
  fi
  echo -e "\n${green}done: $cmd${clean}\n"
done
