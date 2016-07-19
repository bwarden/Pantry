use utf8;
package Pantry::Schema::Result::StockToEvent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Pantry::Schema::Result::StockToEvent

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

=head1 TABLE: C<stock_to_event>

=cut

__PACKAGE__->table("stock_to_event");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 event_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 stock_id

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=head2 event_date

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "event_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "stock_id",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "event_date",
  { data_type => "date", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 event

Type: belongs_to

Related object: L<Pantry::Schema::Result::Event>

=cut

__PACKAGE__->belongs_to(
  "event",
  "Pantry::Schema::Result::Event",
  { id => "event_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "CASCADE",
  },
);

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
    on_delete     => "NO ACTION",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-07-19 15:23:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nVUHzJ+sx386ybJaN3620w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
