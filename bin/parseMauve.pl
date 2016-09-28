#!/usr/bin/perl -w


use warnings;
use strict;
use Carp;
use English;
use Getopt::Long;


GetOptions (

            );

while(<>) {
  chomp;
  next if (/^#/);
  #print "$_\n";

  if (/^> (\d+):/) {
    # It's a seq header
    print "$_\n";
    print "got a header\n";
  } ## if >

  if (/^=/) {
    print "$_\n";
    print "got a separator\n";
  } ## if =
  #last;
} ## while

__END__
