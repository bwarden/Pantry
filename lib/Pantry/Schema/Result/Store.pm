use utf8;
package Pantry::Schema::Result::Store;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::Store

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

=head1 TABLE: C<stores>

=cut

__PACKAGE__->table("stores");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
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

=head2 categories_to_store

Type: has_many

Related object: L<Pantry::Schema::Result::CategoryToStore>

=cut

__PACKAGE__->has_many(
  "categories_to_store",
  "Pantry::Schema::Result::CategoryToStore",
  { "foreign.store_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 13:02:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FLucMX6LfK1zxM5rbWiISw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
