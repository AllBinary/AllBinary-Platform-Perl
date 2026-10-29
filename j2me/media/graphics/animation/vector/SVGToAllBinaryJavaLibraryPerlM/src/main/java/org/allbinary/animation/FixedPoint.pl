# Generated Code Do Not Modify

package org::allbinary::animation::FixedPoint;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $instance = 'org::allbinary::animation::FixedPoint'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ONE} = 1 << 16;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::FixedPoint::instance;
}


sub toFixed {
    my ($self, $val) = @_;
        return int(($val * 65536.0));
}


# Java overloaded method: Perl keeps the last definition
sub toFixed {
    my ($self, $val) = @_;
        return int(($val * 65536.0));
}


sub mul {
    my ($self, $a, $b) = @_;
        return (POSIX::floor((($a * $b)) / (2 ** (16))));
}


sub div {
    my ($self, $a, $b) = @_;
        return (int((($a) << 16) / $b));
}


sub toInt {
    my ($self, $fixed) = @_;
        return POSIX::floor(($fixed) / (2 ** (16)));
}


1;

