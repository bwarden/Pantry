#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 21;

sub not_in_file_ok {
    my ($filename, %regex) = @_;
    open( my $fh, '<', $filename )
        or die "couldn't open $filename for reading: $!";

    my %violated;

    while (my $line = <$fh>) {
        while (my ($desc, $regex) = each %regex) {
            if ($line =~ $regex) {
                push @{$violated{$desc}||=[]}, $.;
            }
        }
    }

    if (%violated) {
        fail("$filename contains boilerplate text");
        diag "$_ appears on lines @{$violated{$_}}" for keys %violated;
    } else {
        pass("$filename contains no boilerplate text");
    }
}

sub module_boilerplate_ok {
    my ($module) = @_;
    not_in_file_ok($module =>
        'the great new $MODULENAME'   => qr/ - The great new /,
        'boilerplate description'     => qr/Quick summary of what the module/,
        'stub function definition'    => qr/function[12]/,
    );
}

TODO: {
  local $TODO = "Need to replace the boilerplate text";

  not_in_file_ok(README =>
    "The README is used..."       => qr/The README is used/,
    "'version information here'"  => qr/to provide version information/,
  );

  not_in_file_ok(Changes =>
    "placeholder date/time"       => qr(Date/time)
  );

  module_boilerplate_ok('lib/Pantry/Schema/Result/CategoryToStore.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Barcode.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Brand.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Category.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/ItemToCategory.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/CodeType.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Event.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Item.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/ProdSize.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Price.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/ShoppingList.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Product.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/StockToEvent.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Stock.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/StockToStorage.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Storage.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Store.pm');
  module_boilerplate_ok('lib/Pantry/Schema/Result/Unit.pm');
  module_boilerplate_ok('lib/Pantry/Schema.pm');


}

