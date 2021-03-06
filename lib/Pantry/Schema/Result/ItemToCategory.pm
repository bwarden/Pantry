use utf8;
package Pantry::Schema::Result::ItemToCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::ItemToCategory

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

=head1 TABLE: C<item_to_category>

=cut

__PACKAGE__->table("item_to_category");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 item_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 category_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "item_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "category_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<item_id_category_id_unique>

=over 4

=item * L</item_id>

=item * L</category_id>

=back

=cut

__PACKAGE__->add_unique_constraint("item_id_category_id_unique", ["item_id", "category_id"]);

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


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 15:23:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mjFSsFQRLOeSCZH7+S2k8Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
