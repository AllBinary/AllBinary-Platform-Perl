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

package org::allbinary::game::ag::ai::scroller::BasePatrolAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';

our $MAX_DISTANCE = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(2);
our $DIRECTION_ARRAY = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(3);
our $FIRING_DISTANCE = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(4);
our $SPEED = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(5);

sub _init_fields {
    my ($self) = @_;
    $self->{maxDistance} = undef;
    $self->{currentDistance} = undef;
    $self->{xTotalDistance} = 0;
    $self->{lastKeyDirection} = $javax::microedition::lcdui::Canvas::RIGHT;
    $self->{keyDirection} = $javax::microedition::lcdui::Canvas::RIGHT;
}


sub new {
    my ($class, $hashtable, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{maxDistance} = $hashtable->get($org::allbinary::game::ag::ai::scroller::BasePatrolAI::MAX_DISTANCE);
        $self->{currentDistance} = int($self->{maxDistance});
    return $self;
}


sub update {
    my ($self) = @_;
        $self->updateTotalDistance();
        $self->changeDirectionIfReachedPacingAreaMax();
}


sub updateTotalDistance {
    my ($self) = @_;
        my $velocityInterfaceCompositeInterface = $self->getOwnerLayerInterface();
        my $velocityProperties = $velocityInterfaceCompositeInterface->getVelocityProperties();
        $self->{xTotalDistance} += $velocityProperties->getVelocityXBasicDecimalP()->getScaled();
}


sub changeDirectionIfReachedPacingAreaMax {
    my ($self) = @_;
        my $mathUtil = 'org::allbinary::logic::math::MathUtil'->getInstance();
        my $totalDistance = $mathUtil->abs($self->{xTotalDistance});
        if ($totalDistance > $self->{currentDistance}) {
            $self->nextDirection();
        }
}


sub nextDirection {
    my ($self) = @_;
        if ($self->{lastKeyDirection} == $javax::microedition::lcdui::Canvas::LEFT) {
            $self->{keyDirection} = $javax::microedition::lcdui::Canvas::RIGHT;
            $self->{lastKeyDirection} = $self->{keyDirection};
            $self->{xTotalDistance} = 0;
        } elsif ($self->{lastKeyDirection} == $javax::microedition::lcdui::Canvas::RIGHT) {
            $self->{keyDirection} = $javax::microedition::lcdui::Canvas::LEFT;
            $self->{lastKeyDirection} = $self->{keyDirection};
            $self->{xTotalDistance} = 0;
        }
}


sub disable {
    my ($self) = @_;
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::game::physics::velocity::VelocityInterfaceCompositeInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::math::MathUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::util::ABHashtable;

1;

