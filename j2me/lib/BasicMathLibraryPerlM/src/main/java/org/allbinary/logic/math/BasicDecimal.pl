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

package org::allbinary::logic::math::BasicDecimal;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $ZERO_BIGDECIMAL = 'org::allbinary::logic::math::BasicDecimal'->new(0);

sub _init_fields {
    my ($self) = @_;
    $self->{units} = undef;
    $self->{scaled} = 0;
    $self->{factor} = 'org::allbinary::logic::math::ScaleFactorFactory'->getInstance()->{DEFAULT_SCALE_FACTOR};
    $self->{factorValue} = 'org::allbinary::logic::math::ScaleFactorFactory'->getInstance()->{DEFAULT_SCALE_VALUE};
}


sub createBigDecimal {
    my ($class, $bigDecimal) = @_;
        return 'org::allbinary::logic::math::BasicDecimal'->new($bigDecimal->getUnscaled());
}


sub new {
    my ($class, $units) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{units} = $units;
        $self->updateScaled();
    return $self;
}


sub setint {
    my ($self, $value) = @_;
        $self->{units} = $value;
        $self->updateScaled();
}


sub setlong {
    my ($self, $value) = @_;
        $self->{units} = $value;
        $self->updateScaled();
}


sub set {
    my ($self, $bigDecimal) = @_;
        $self->{units} = $bigDecimal->getUnscaled();
        $self->updateScaled();
}


sub addint {
    my ($self, $value) = @_;
        $self->{units} = $self->{units} + $value;
        $self->updateScaled();
}


sub addlong {
    my ($self, $value) = @_;
        $self->{units} = $self->{units} + $value;
        $self->updateScaled();
}


sub add {
    my ($self, $bigDecimal) = @_;
        $self->{units} = $self->{units} + $bigDecimal->getUnscaled();
        $self->updateScaled();
}


sub subtractint {
    my ($self, $value) = @_;
        $self->{units} = $self->{units} - $value;
        $self->updateScaled();
}


sub subtractlong {
    my ($self, $value) = @_;
        $self->{units} = $self->{units} - $value;
        $self->updateScaled();
}


sub subtract {
    my ($self, $bigDecimal) = @_;
        $self->{units} = $self->{units} - $bigDecimal->getUnscaled();
        $self->updateScaled();
}


sub multiplyint {
    my ($self, $value) = @_;
        $self->{units} = $self->{units} * $value;
        $self->updateScaled();
}


sub multiplylong {
    my ($self, $value) = @_;
        $self->{units} = $self->{units} * $value;
        $self->updateScaled();
}


sub multiply {
    my ($self, $bigDecimal) = @_;
        $self->{units} = $self->{units} * $bigDecimal->getUnscaled();
        $self->updateScaled();
}


sub divideint {
    my ($self, $value) = @_;
        $self->{units} = int($self->{units} / $value);
        $self->updateScaled();
}


sub dividelong {
    my ($self, $value) = @_;
        $self->{units} = int($self->{units} / $value);
        $self->updateScaled();
}


sub divide {
    my ($self, $bigDecimal) = @_;
        $self->{units} = $self->{units} / $bigDecimal->getUnscaled();
        $self->updateScaled();
}


sub getUnscaled {
    my ($self) = @_;
        return $self->{units};
}


sub updateScaled {
    my ($self) = @_;
        $self->{scaled} = (int($self->{units} / $self->{factorValue}));
}


sub getScaled {
    my ($self) = @_;
        return $self->{scaled};
}


sub toString {
    my ($self) = @_;
        return ("" . ($self->{units}));
}


sub getScaledFactor {
    my ($self) = @_;
        return $self->{factor};
}


sub getScaledFactorValue {
    my ($self) = @_;
        return $self->{factorValue};
}

use org::allbinary::logic::math::ScaleFactorFactory;

1;

