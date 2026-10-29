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

package org::allbinary::game::ag::ai::scroller::PacePatrolAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();
use parent -norequire,'org::allbinary::game::ag::ai::scroller::BasePatrolAI','org::allbinary::game::tracking::TrackingEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{trackingList} = undef;
    $self->{firingDistance} = 0;
    $self->{isFollowLimitedByTerrain} = 0;
}


sub new {
    my ($class, $hashtable, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($hashtable, $ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->addListenerInterface($self);
        $self->{trackingList} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        $self->update();
        my $direction = $self->setFiringDirectionForTargetIfInRange();
        my $directionFactory = 'org::allbinary::direction::DirectionFactory'->getInstance();
        if ($direction == $directionFactory->{LEFT}) {
            if ($self->{lastKeyDirection} != $self->{keyDirection} || !$self->{isFollowLimitedByTerrain}) {
                $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::LEFT);
            }
            $self->{keyDirection} = $javax::microedition::lcdui::Canvas::LEFT;
            $self->{lastKeyDirection} = $self->{keyDirection};
            $self->{xTotalDistance} = 0;
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_NUM1);
        } elsif ($direction == $directionFactory->{RIGHT}) {
            if ($self->{lastKeyDirection} != $self->{keyDirection} || !$self->{isFollowLimitedByTerrain}) {
                $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::RIGHT);
            }
            $self->{keyDirection} = $javax::microedition::lcdui::Canvas::RIGHT;
            $self->{lastKeyDirection} = $self->{keyDirection};
            $self->{xTotalDistance} = 0;
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_NUM1);
        } else {
            $self->SUPER::processKeyAI($self->{keyDirection});
        }
}


sub setFiringDirectionForTargetIfInRange {
    my ($self) = @_;
        my $directionFactory = 'org::allbinary::direction::DirectionFactory'->getInstance();
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        my $direction = $directionFactory->{NOT_BORDERED_WITH};
        my $lastTrackingEvent = undef;
        my $lastTrackingLayerInterface = undef;
        my $directionCompositeInterface = undef;
        my $size = $self->{trackingList}->size();
        for (my $index = 0; $index < $size; $index++) {
            $lastTrackingEvent = $self->{trackingList}->get(0);
            $lastTrackingLayerInterface = $lastTrackingEvent->getLayerInterface();
            my $x = $lastTrackingLayerInterface->getXP();
            my $y = $lastTrackingLayerInterface->getYP();
            my $yDistance = $ownerLayerInterface->getYP() - $y - $ownerLayerInterface->getHeight();
            my $xDistance = $ownerLayerInterface->getXP() - $x - $ownerLayerInterface->getWidth();
            my $absXDistance = abs($xDistance);
            my $absYDistance = abs($yDistance);
            if ($absYDistance <= 100) {
                if ($absXDistance < int($self->getFiringDistance() / 2)) {
                    $directionCompositeInterface = $self->getOwnerLayerInterface();
                    if ($xDistance < 0 && $directionCompositeInterface->getDirection() == $directionFactory->{RIGHT}) {
                        $direction = $directionFactory->{RIGHT};
                    } elsif ($xDistance > 0 && $directionCompositeInterface->getDirection() == $directionFactory->{LEFT}) {
                        $direction = $directionFactory->{LEFT};
                    }
                }
            }
        }
        return $direction;
}


sub disable {
    my ($self) = @_;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onMovement {
    my ($self, $trackingEvent) = @_;
        $self->{trackingList}->clear();
        $self->{trackingList}->add($trackingEvent);
}


sub getFiringDistance {
    my ($self) = @_;
        return $self->{firingDistance};
}


sub setFiringDistance {
    my ($self, $firingDistance) = @_;
        $self->{firingDistance} = $firingDistance;
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionCompositeInterface;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::tracking::TrackingEvent;
use org::allbinary::game::tracking::TrackingEventHandler;
use org::allbinary::game::tracking::TrackingEventListenerInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::LayerInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::ag::ai::scroller::BasePatrolAI;

1;

