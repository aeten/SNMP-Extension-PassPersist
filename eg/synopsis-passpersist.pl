#!/usr/bin/perl
use strict;
use SNMP::Extension::PassPersist;

# create the object
my $extsnmp = SNMP::Extension::PassPersist->new(
    backend_init    => \&init_tree,
    backend_collect => \&update_tree,
);

# run the program
$extsnmp->run;

sub init_tree {
    $extsnmp->add_oid_entry(".1.2.42.2", "string" , "the answer");
}

sub update_tree {
    my ($self) = @_;

    # add a few OID entries
    $self->add_oid_entry(".1.2.42.1", "integer", 42);
}
