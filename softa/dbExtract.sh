#!/usr/bin/env bash

SessionID="dbtool-$(uuidgen)"
mkdir /tmp/$SessionID/
cd /tmp/$SessionID
#http://c602s/custom/custom.db

wget http://c602s/custom/custom.db
mkdir purettu && cd purettu
tar -xzf ../custom.db


for i in ../purettu/*; do
  missä=$(pwd)
  /usr/bin/cdbau/haePKGBUILD.sh $missä/$i
done


if [[ "--debug" == "$1" ]]; then
  echo $SessionID
  ls -la
  pwd
fi
