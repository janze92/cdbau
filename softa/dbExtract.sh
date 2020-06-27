#!/usr/bin/env bash
source /etc/cdbau.conf
SessionID="dbtool-$(uuidgen)"
mkdir $runningDIR/$SessionID/
cd $runningDIR/$SessionID

wget $customServerRepoADDR
mkdir purettu && cd purettu
tar -xzf ../$dbNAME


for i in ../purettu/*; do
  missä=$(pwd)
  /usr/bin/cdbau/haePKGBUILD.sh $missä/$i
done


if [[ "--debug" == "$1" ]]; then
  echo $SessionID
  ls -la
  pwd
fi
