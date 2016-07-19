use utf8;
package Pantry::Schema::Result::Stock;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::Stock

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

=head1 TABLE: C<stock>

=cut

__PACKAGE__->table("stock");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 product_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "product_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 product

Type: belongs_to

Related object: L<Pantry::Schema::Result::Product>

=cut

__PACKAGE__->belongs_to(
  "product",
  "Pantry::Schema::Result::Product",
  { id => "product_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=head2 stock_to_events

Type: has_many

Related object: L<Pantry::Schema::Result::StockToEvent>

=cut

__PACKAGE__->has_many(
  "stock_to_events",
  "Pantry::Schema::Result::StockToEvent",
  { "foreign.stock_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_to_storage

Type: might_have

Related object: L<Pantry::Schema::Result::StockToStorage>

=cut

__PACKAGE__->might_have(
  "stock_to_storage",
  "Pantry::Schema::Result::StockToStorage",
  { "foreign.stock_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 13:02:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+xM8UrvtTicdjETdNeVoIw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
