#!/bin/bash

dir=$1
for f in $dir/*.fa 
do
  infile=$f
  outfile=${infile/data/nexus}
  outfile=${outfile/\.fa/.nex}
  echo reformating $outfile...
  java -cp src/readseq.jar run -o $outfile -f NEXUS $infile
done
exit

while (<>) {

}


