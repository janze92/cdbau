#!/usr/bin/env bash
source /etc/cdbau.conf
SessionID="dbtool-$(uuidgen)"
mkdir $runningDIR/$SessionID/
cd $runningDIR/$SessionID

wget $customServerRepoADDR
mkdir purettu && cd purettu
tar -xzf ../$dbNAME


for i in /*; do
  missa=$(pwd)
  /usr/bin/cdbau/haePKGBUILD.sh $missa/$i
done


if [[ "--debug" == "$1" ]]; then
  echo $SessionID
  ls -la
  pwd
fi
