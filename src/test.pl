#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: test.pl
#
#        USAGE: ./test.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Brett T. Warden (btw), bwarden@wgz.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 07/19/2016 12:46:04 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/../lib";

use YAML qw(Dump);

use Pantry::Schema;

my $schema = Pantry::Schema->connect("dbi:SQLite:$Bin/../data/pantry.db");

my $store_resultset = $schema->resultset('Store');

my @stores = $store_resultset->all();
foreach my $store (@stores)
{
  print $store->name, "\n";
}

my $newprod = $schema->resultset('Barcode')->create(
  {
    code_type => {
      name => 'UPC-A',
    },
    code => '0072830400053',
    product => {
      name => 'Oregon Strawberry Yogurt',
      brand => {
        name => 'Tillamook',
      },
      prod_size => {
        value => 6,
        unit => {
          single => 'fluid ounce',
        },
      },
      item => {
        name => 'yogurt singles',
      },
    },
  }
);

my $newmilk = $schema->resultset('Item')->create(
  {
    parent => {
      name => 'Milk',
    },
    name => '2% Milk',
  }
);
