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

package org::allbinary::math::AngleIncrementInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $instance = 'org::allbinary::math::AngleIncrementInfoFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{angleIncrementInfo} = [(undef) x (int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}))];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::math::AngleIncrementInfoFactory::instance;
}


sub getAt {
    my ($self, $angleIncrement) = @_;
        my $halfAngleIncrement = (POSIX::floor(($angleIncrement) / (2 ** (1))));
        my $angleIncrementInfo = undef;
        my $angleIncrementInfoCanBeNull = $self->{angleIncrementInfo}->[$halfAngleIncrement];
        if (!defined($angleIncrementInfoCanBeNull)) {
            $angleIncrementInfo = 'org::allbinary::math::AngleIncrementInfo'->new($angleIncrement);
            $self->{angleIncrementInfo}->[$halfAngleIncrement] = $angleIncrementInfo;
            return $angleIncrementInfo;
        } else {
            $angleIncrementInfo = $angleIncrementInfoCanBeNull;
        }
        return $angleIncrementInfo;
}

use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleIncrementInfo;

1;

