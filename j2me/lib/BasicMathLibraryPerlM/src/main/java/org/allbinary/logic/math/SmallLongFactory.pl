#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::math::SmallLongFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::math::SmallLongFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NEGATIVE_MAX} = 500;
    $self->{POSITIVE_MAX} = 0x2D1;
    $self->{INTEGER_ARRAY} = [(undef) x ($self->{NEGATIVE_MAX} + $self->{POSITIVE_MAX})];
    $self->{STRING_ARRAY} = [(undef) x ($self->{NEGATIVE_MAX} + $self->{POSITIVE_MAX})];
    $self->{MIN} = 0;
    $self->{lastMin} = 0;
    $self->{lastNegativeMin} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::math::SmallLongFactory::instance;
}


sub initWithRange {
    my ($self, $value, $negativeValue) = @_;
        for (my $index = $value - 1; $index >= $self->{lastMin}; $index--) {
            $self->{INTEGER_ARRAY}->[$index + $self->{NEGATIVE_MAX}] = $index;
        }
        for (my $index = $negativeValue - 1; $index >= $self->{lastNegativeMin}; $index--) {
            $self->{INTEGER_ARRAY}->[$index] = -$index;
        }
        if ($self->{lastMin} < $value) {
            $self->{lastMin} = $value;
            $self->{MIN} = $value;
        }
        if ($self->{lastNegativeMin} < $negativeValue) {
            $self->{lastNegativeMin} = $negativeValue;
        }
}


sub init {
    my ($self) = @_;
        if (!defined($self->{INTEGER_ARRAY}->[0])) {
            if ($self->{lastMin} < $self->{POSITIVE_MAX} || $self->{lastNegativeMin} < $self->{NEGATIVE_MAX}) {
                for (my $index = $self->{POSITIVE_MAX} - 1; $index >= $self->{lastMin}; $index--) {
                    $self->{INTEGER_ARRAY}->[$index + $self->{NEGATIVE_MAX}] = $index;
                }
                for (my $index = $self->{NEGATIVE_MAX} - 1; $index >= $self->{lastNegativeMin}; $index--) {
                    $self->{INTEGER_ARRAY}->[$index] = -$index;
                }
                $self->{lastMin} = $self->{POSITIVE_MAX};
                $self->{lastNegativeMin} = $self->{NEGATIVE_MAX};
            }
        }
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstanceNoThrow {
    my ($self, $index) = @_;
        if ($index + $self->{NEGATIVE_MAX} > scalar(@{$self->{INTEGER_ARRAY}}) - 1) {
            return $self->{INTEGER_ARRAY}->[-1 + $self->{NEGATIVE_MAX}];
        }
        return $self->{INTEGER_ARRAY}->[($index) + $self->{NEGATIVE_MAX}];
}


sub getString {
    my ($self, $index) = @_;
        my $i = $index + $self->{NEGATIVE_MAX};
        if (!defined($self->{STRING_ARRAY}->[$i])) {
            $self->{STRING_ARRAY}->[$i] = $self->{INTEGER_ARRAY}->[$i]->toString();
        }
        return $self->{STRING_ARRAY}->[$i];
}


1;

