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

package org::allbinary::direction::DirectionUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::direction::DirectionUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{directionArray} = [(undef) x (10)];
    $self->{directionArray2} = [(undef) x (10)];
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::direction::DirectionUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $angleFactory = 'org::allbinary::math::AngleFactory'->getInstance();
        my $directionFactory = 'org::allbinary::direction::DirectionFactory'->getInstance();
        $self->{directionArray}->[$directionFactory->{LEFT}->getValue()] = $angleFactory->{LEFT};
        $self->{directionArray}->[$directionFactory->{RIGHT}->getValue()] = $angleFactory->{RIGHT};
        $self->{directionArray}->[$directionFactory->{UP}->getValue()] = $angleFactory->{UP};
        $self->{directionArray}->[$directionFactory->{DOWN}->getValue()] = $angleFactory->{DOWN};
        $self->{directionArray2}->[$directionFactory->{LEFT}->getValue()] = $angleFactory->{LEFT};
        $self->{directionArray2}->[$directionFactory->{RIGHT}->getValue()] = $angleFactory->{RIGHT};
        $self->{directionArray2}->[$directionFactory->{UP}->getValue()] = $angleFactory->{UP};
        $self->{directionArray2}->[$directionFactory->{DOWN}->getValue()] = $angleFactory->{DOWN};
    return $self;
}


sub getAngle {
    my ($self, $direction) = @_;
        return $self->{directionArray2}->[$direction->getValue()];
}


sub getFrameAngle {
    my ($self, $direction) = @_;
        return $self->{directionArray}->[$direction->getValue()];
}

use org::allbinary::math::Angle;
use org::allbinary::math::AngleFactory;
use org::allbinary::direction::DirectionFactory;

1;

