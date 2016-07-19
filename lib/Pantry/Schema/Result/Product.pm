use utf8;
package Pantry::Schema::Result::Product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::Product

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<products>

=cut

__PACKAGE__->table("products");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 details

  data_type: 'text'
  is_nullable: 1

=head2 item_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 brand_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 prod_size_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "details",
  { data_type => "text", is_nullable => 1 },
  "item_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "brand_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "prod_size_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<name_brand_id_prod_size_id_unique>

=over 4

=item * L</name>

=item * L</brand_id>

=item * L</prod_size_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "name_brand_id_prod_size_id_unique",
  ["name", "brand_id", "prod_size_id"],
);

=head1 RELATIONS

=head2 barcodes

Type: has_many

Related object: L<Pantry::Schema::Result::Barcode>

=cut

__PACKAGE__->has_many(
  "barcodes",
  "Pantry::Schema::Result::Barcode",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 brand

Type: belongs_to

Related object: L<Pantry::Schema::Result::Brand>

=cut

__PACKAGE__->belongs_to(
  "brand",
  "Pantry::Schema::Result::Brand",
  { id => "brand_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "CASCADE",
  },
);

=head2 item

Type: belongs_to

Related object: L<Pantry::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "item",
  "Pantry::Schema::Result::Item",
  { id => "item_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "CASCADE",
  },
);

=head2 prices

Type: has_many

Related object: L<Pantry::Schema::Result::Price>

=cut

__PACKAGE__->has_many(
  "prices",
  "Pantry::Schema::Result::Price",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 prod_size

Type: belongs_to

Related object: L<Pantry::Schema::Result::ProdSize>

=cut

__PACKAGE__->belongs_to(
  "prod_size",
  "Pantry::Schema::Result::ProdSize",
  { id => "prod_size_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "CASCADE",
  },
);

=head2 stocks

Type: has_many

Related object: L<Pantry::Schema::Result::Stock>

=cut

__PACKAGE__->has_many(
  "stocks",
  "Pantry::Schema::Result::Stock",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 15:23:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nRX9J1JWYPab4V5i2PcA+A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
