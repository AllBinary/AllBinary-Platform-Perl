# Generated Code Do Not Modify

package org::allbinary::logic::math::MathUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $instance = 'org::allbinary::logic::math::MathUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ACCURACY} = 100;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::math::MathUtil::instance;
}


sub getTotalDigits {
    my ($self, $digits) = @_;
        my $total = 0;
        while ($digits > 0) {
            $digits = int($digits / 10);
            $total++;
        }
        return $total;
}


sub sqrt {
    my ($self, $value) = @_;
        if ($value <= 1) {
            return $value;
        }
        my $accumulated = POSIX::floor(($value) / (2 ** (1)));
        my $result = POSIX::floor((($accumulated + (int($value / $accumulated)))) / (2 ** (1)));
        while (1) {
            $accumulated = $result;
            $result = POSIX::floor((($accumulated + (int($value / $accumulated)))) / (2 ** (1)));
            last unless ($accumulated > $result);
        }
        return $accumulated;
}


sub sqrtd {
    my ($self, $x) = @_;
        if ($x == 0) {
            return 0.0;
        }
        if ($x < 0) {
            return -1.0;
        }
        my $result = $x;
        for (my $index = 0; $index < $self->{ACCURACY}; $index++) {
            $result = ($result + ($x / $result)) / 2.0;
        }
        return $result;
}


sub abs {
    my ($self, $value) = @_;
        return (($value < 0) ? -$value : $value);
}


sub abslong {
    my ($self, $value) = @_;
        return (($value < 0) ? -$value : $value);
}


sub min {
    my ($self, $value, $value2) = @_;
        return (($value <= $value2) ? $value : $value2);
}


sub max {
    my ($self, $value, $value2) = @_;
        return (($value >= $value2) ? $value : $value2);
}

# use jsinterop::annotations::JsType;

1;

