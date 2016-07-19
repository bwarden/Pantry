use utf8;
package Pantry::Schema::Result::ProdSize;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::ProdSize

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

=head1 TABLE: C<prod_size>

=cut

__PACKAGE__->table("prod_size");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 value

  data_type: 'float'
  is_nullable: 1

=head2 unit_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "value",
  { data_type => "float", is_nullable => 1 },
  "unit_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 products

Type: has_many

Related object: L<Pantry::Schema::Result::Product>

=cut

__PACKAGE__->has_many(
  "products",
  "Pantry::Schema::Result::Product",
  { "foreign.prod_size_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 unit

Type: belongs_to

Related object: L<Pantry::Schema::Result::Unit>

=cut

__PACKAGE__->belongs_to(
  "unit",
  "Pantry::Schema::Result::Unit",
  { id => "unit_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 13:02:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7fh2gLOzz2a8YwuT/b4VbA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
