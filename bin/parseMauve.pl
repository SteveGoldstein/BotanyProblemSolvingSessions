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

while(<>) {
  chomp;
  next if (/^#/);

  if (/^=/) {
    if (scalar @seqsInBlock == $numSeqs) {
      print join("\n", @outputBlock), "\n";
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
