#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 19;

BEGIN {
    use_ok( 'Pantry::Schema::Result::CategoryToStore' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Barcode' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Brand' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Category' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::ItemToCategory' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::CodeType' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Event' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Item' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::ProdSize' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Price' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::ShoppingList' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Product' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::StockToEvent' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Stock' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::StockToStorage' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Storage' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Store' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema::Result::Unit' ) || print "Bail out!\n";
    use_ok( 'Pantry::Schema' ) || print "Bail out!\n";
}

diag( "Testing Pantry::Schema::Result::CategoryToStore $Pantry::Schema::Result::CategoryToStore::VERSION, Perl $], $^X" );
