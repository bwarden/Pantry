use utf8;
package Pantry::Schema::Result::CategoryToStore;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::CategoryToStore

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

=head1 TABLE: C<category_to_store>

=cut

__PACKAGE__->table("category_to_store");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 category_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 store_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "category_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "store_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<category_id_store_id_unique>

=over 4

=item * L</category_id>

=item * L</store_id>

=back

=cut

__PACKAGE__->add_unique_constraint("category_id_store_id_unique", ["category_id", "store_id"]);

=head1 RELATIONS

=head2 category

Type: belongs_to

Related object: L<Pantry::Schema::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "category",
  "Pantry::Schema::Result::Category",
  { id => "category_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=head2 store

Type: belongs_to

Related object: L<Pantry::Schema::Result::Store>

=cut

__PACKAGE__->belongs_to(
  "store",
  "Pantry::Schema::Result::Store",
  { id => "store_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 13:02:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zu/4JPGXP3OItnLgOFCnAQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
