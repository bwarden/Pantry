use utf8;
package Pantry::Schema::Result::Unit;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::Unit

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

=head1 TABLE: C<units>

=cut

__PACKAGE__->table("units");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 single

  data_type: 'text'
  is_nullable: 1

=head2 plural

  data_type: 'text'
  is_nullable: 1

=head2 abbrev

  data_type: 'text'
  is_nullable: 1

=head2 parent_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 divisor

  data_type: 'float'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "single",
  { data_type => "text", is_nullable => 1 },
  "plural",
  { data_type => "text", is_nullable => 1 },
  "abbrev",
  { data_type => "text", is_nullable => 1 },
  "parent_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "divisor",
  { data_type => "float", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<abbrev_unique>

=over 4

=item * L</abbrev>

=back

=cut

__PACKAGE__->add_unique_constraint("abbrev_unique", ["abbrev"]);

=head2 C<plural_unique>

=over 4

=item * L</plural>

=back

=cut

__PACKAGE__->add_unique_constraint("plural_unique", ["plural"]);

=head2 C<single_unique>

=over 4

=item * L</single>

=back

=cut

__PACKAGE__->add_unique_constraint("single_unique", ["single"]);

=head1 RELATIONS

=head2 parent

Type: belongs_to

Related object: L<Pantry::Schema::Result::Unit>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "Pantry::Schema::Result::Unit",
  { id => "parent_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 prod_sizes

Type: has_many

Related object: L<Pantry::Schema::Result::ProdSize>

=cut

__PACKAGE__->has_many(
  "prod_sizes",
  "Pantry::Schema::Result::ProdSize",
  { "foreign.unit_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 units

Type: has_many

Related object: L<Pantry::Schema::Result::Unit>

=cut

__PACKAGE__->has_many(
  "units",
  "Pantry::Schema::Result::Unit",
  { "foreign.parent_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 13:02:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oZcv9sKDEHPe/riolgPh8g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
