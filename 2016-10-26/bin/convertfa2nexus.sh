#!/bin/bash

infile=data/lcbBlock1.fa
outfile=nexus/lcbBlock1.nex

java -cp src/readseq.jar run -o $outfile -f NEXUS $infile 
