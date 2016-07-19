use utf8;
package Pantry::Schema::Result::StockToStorage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::StockToStorage

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

=head1 TABLE: C<stock_to_storage>

=cut

__PACKAGE__->table("stock_to_storage");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 stock_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 storage_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "stock_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "storage_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<stock_id_unique>

=over 4

=item * L</stock_id>

=back

=cut

__PACKAGE__->add_unique_constraint("stock_id_unique", ["stock_id"]);

=head1 RELATIONS

=head2 stock

Type: belongs_to

Related object: L<Pantry::Schema::Result::Stock>

=cut

__PACKAGE__->belongs_to(
  "stock",
  "Pantry::Schema::Result::Stock",
  { id => "stock_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=head2 storage

Type: belongs_to

Related object: L<Pantry::Schema::Result::Storage>

=cut

__PACKAGE__->belongs_to(
  "storage",
  "Pantry::Schema::Result::Storage",
  { id => "storage_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 13:02:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:12n0z5aMtd9RnvdmG4azNw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
