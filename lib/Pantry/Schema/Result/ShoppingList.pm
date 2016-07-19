use utf8;
package Pantry::Schema::Result::ShoppingList;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::ShoppingList

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

=head1 TABLE: C<shopping_list>

=cut

__PACKAGE__->table("shopping_list");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 item_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 quantity_needed

  data_type: 'float'
  is_nullable: 1

=head2 quantity_obtained

  data_type: 'float'
  is_nullable: 1

=head2 notes

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "item_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "quantity_needed",
  { data_type => "float", is_nullable => 1 },
  "quantity_obtained",
  { data_type => "float", is_nullable => 1 },
  "notes",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

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
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 13:02:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LX3j8oBfb4uxPspg8RM/jw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
