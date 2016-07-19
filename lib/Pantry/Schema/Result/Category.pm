use utf8;
package Pantry::Schema::Result::Category;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::Category

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

=head1 TABLE: C<categories>

=cut

__PACKAGE__->table("categories");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 parent_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "parent_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<name_unique>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("name_unique", ["name"]);

=head1 RELATIONS

=head2 categories

Type: has_many

Related object: L<Pantry::Schema::Result::Category>

=cut

__PACKAGE__->has_many(
  "categories",
  "Pantry::Schema::Result::Category",
  { "foreign.parent_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 categories_to_store

Type: has_many

Related object: L<Pantry::Schema::Result::CategoryToStore>

=cut

__PACKAGE__->has_many(
  "categories_to_store",
  "Pantry::Schema::Result::CategoryToStore",
  { "foreign.category_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_to_categories

Type: has_many

Related object: L<Pantry::Schema::Result::ItemToCategory>

=cut

__PACKAGE__->has_many(
  "item_to_categories",
  "Pantry::Schema::Result::ItemToCategory",
  { "foreign.category_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent

Type: belongs_to

Related object: L<Pantry::Schema::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "Pantry::Schema::Result::Category",
  { id => "parent_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 13:02:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:es6oX51zhMapiogoDLlvsQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
