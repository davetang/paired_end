#!/usr/bin/perl

use strict;
use warnings;

my $usage = "Usage: $0 <infile.tsv>\n";
my $infile = shift or die $usage;

my @rows = ();
my @transposed = ();

open(IN,'<',$infile) || die "Could not open $infile: $!\n";
while(<IN>){
   chomp;
   next if /^#/;
   next if /^$/;
   my @s = split(/\s+/);
   push(@rows, \@s);
}

for my $row (@rows){
   for my $column (0 .. $#{$row}){
      push(@{$transposed[$column]}, $row->[$column]);
   }
}

for my $new_row (@transposed){
   for my $new_col (@{$new_row}){
      print $new_col, "\t";
   }
   print "\n";
}

exit(0);
