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

package org::allbinary::game::layer::Driver;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_DRIVER = 'org::allbinary::game::layer::Driver'->new('org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0), 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0), 'org::allbinary::game::layer::Aggression'->new('org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0), 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0), 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0)));

sub _init_fields {
    my ($self) = @_;
    $self->{turnSpeed} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0);
    $self->{trackPathSelectionSkill} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0);
    $self->{aggression} = undef;
}


sub new {
    my ($class, $turnSpeed, $trackPathSelectionSkill, $aggression) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setTurnSpeed($turnSpeed);
        $self->setTrackPathSelectionSkill($trackPathSelectionSkill);
        $self->{aggression} = $aggression;
    return $self;
}


sub getTurnSpeed {
    my ($self) = @_;
        return $self->{turnSpeed};
}


sub setTurnSpeed {
    my ($self, $turnSpeed) = @_;
        $self->{turnSpeed} = $turnSpeed;
}


sub getTrackPathSelectionSkill {
    my ($self) = @_;
        return $self->{trackPathSelectionSkill};
}


sub setTrackPathSelectionSkill {
    my ($self, $trackPathSelectionSkill) = @_;
        $self->{trackPathSelectionSkill} = $trackPathSelectionSkill;
}


sub getAggression {
    my ($self) = @_;
        return $self->{aggression};
}


sub setAggression {
    my ($self, $aggression) = @_;
        $self->{aggression} = $aggression;
}

use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::game::layer::Aggression;

1;

