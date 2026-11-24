# Generated Code Do Not Modify

package org::allbinary::animation::FixedPoint;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::animation::FixedPoint'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{ONE} = 1 << 16;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::FixedPoint::instance;
}


sub toFixed_j1_1 {
    my ($self, $val) = @_;
        return int(($val * 65536.0));
}


sub toFixed_j1_2 {
    my ($self, $val) = @_;
        return int(($val * 65536.0));
}

sub toFixed {
    my ($invocant, @arguments) = @_;
    return $invocant->toFixed_j1(@arguments) if scalar(@arguments) == 1;
    die "No method toFixed takes " . scalar(@arguments) . " arguments";
}

sub toFixed_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->toFixed_j1_1(@arguments) if 1 && !ref($arguments[0]);
    return $invocant->toFixed_j1_2(@arguments);
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

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

