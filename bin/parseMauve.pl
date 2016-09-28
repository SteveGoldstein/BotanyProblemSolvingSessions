#!/usr/bin/perl -w


use warnings;
use strict;
use Carp;
use English;
use Getopt::Long;

GetOptions (

            );

my @outputBlock;
my @seqsInBlock;
my $numSeqs = 5;
my $currentSeqIndex;
my $outputDir = 'mauveLCBs';
my $lcbIndex = 0;

while(<>) {
  chomp;
  next if (/^#/);

  if (/^=/) {
    if (scalar @seqsInBlock == $numSeqs) {
      $lcbIndex ++;
      open OUT, ">$outputDir/lcbBlock$lcbIndex.fa";
      print OUT join("\n", @outputBlock), "\n";
      close OUT;
    } ## if complete block
    @seqsInBlock = ();
    @outputBlock = ();
    next;
  } ## if =

  push @outputBlock, $_;
  if (/^> (\d+):/) {
    # It's a seq header
    my $seqIndex = $1;
    push @seqsInBlock, $seqIndex;
  } ## if >


  #last;
} ## while

__END__
