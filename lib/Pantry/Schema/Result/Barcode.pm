use utf8;
package Pantry::Schema::Result::Barcode;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::Barcode

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

=head1 TABLE: C<barcodes>

=cut

__PACKAGE__->table("barcodes");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 code

  data_type: 'text'
  is_nullable: 1

=head2 code_type_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 product_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "code",
  { data_type => "text", is_nullable => 1 },
  "code_type_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "product_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<code_code_type_id_product_id_unique>

=over 4

=item * L</code>

=item * L</code_type_id>

=item * L</product_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "code_code_type_id_product_id_unique",
  ["code", "code_type_id", "product_id"],
);

=head1 RELATIONS

=head2 code_type

Type: belongs_to

Related object: L<Pantry::Schema::Result::CodeType>

=cut

__PACKAGE__->belongs_to(
  "code_type",
  "Pantry::Schema::Result::CodeType",
  { id => "code_type_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

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


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 13:02:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UCrE/Ul6t964d4aCr4qsmg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
