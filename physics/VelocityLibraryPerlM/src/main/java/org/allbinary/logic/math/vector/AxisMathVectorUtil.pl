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

package org::allbinary::logic::math::vector::AxisMathVectorUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::math::vector::AxisMathVectorUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{noDecimalTrigTable} = 'org::allbinary::math::NoDecimalTrigTable'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::math::vector::AxisMathVectorUtil::instance;
}


sub calculateX {
    my ($self, $magnitude, $angle) = @_;
        return $magnitude * $self->{noDecimalTrigTable}->cos($angle) / 10;
}


sub calculateY {
    my ($self, $magnitude, $angle) = @_;
        return $magnitude * $self->{noDecimalTrigTable}->sin($angle) / 10;
}


sub calculateZ {
    my ($self, $magnitude, $otherAngle) = @_;
        return $magnitude * $self->{noDecimalTrigTable}->sin($otherAngle) / 10;
}

use org::allbinary::math::NoDecimalTrigTable;

1;

