#!/usr/bin/env bash
source /etc/cdbau.conf
SessionID="dbtool-$(uuidgen)"
mkdir $runningDIR/$SessionID/
cd $runningDIR/$SessionID

wget $customServerRepoADDR
if [[ -e $dbNAME ]]; then
  mkdir purettu && cd purettu
  tar -xzf ../$dbNAME

  for i in *; do
    missa=$(pwd)
    #/usr/bin/cdbau/haePKGBUILD.sh $missa/$i
    echo $missa/$i
  done
fi



if [[ "--debug" == "$1" ]]; then
  echo "Repo address: $customServerRepoADDR"
  echo "Running dir: $runningDIR"
  echo "Session dir: $SessionID"
  ls -la
  pwd
fi
