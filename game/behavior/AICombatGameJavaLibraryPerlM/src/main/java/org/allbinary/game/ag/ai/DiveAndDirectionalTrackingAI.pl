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

package org::allbinary::game::ag::ai::DiveAndDirectionalTrackingAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI','org::allbinary::game::tracking::TrackingEventListenerInterface','org::allbinary::game::combat::destroy::event::DestroyedEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{mathUtil} = 'org::allbinary::logic::math::MathUtil'->getInstance();
    $self->{directionFactory} = 'org::allbinary::direction::DirectionFactory'->getInstance();
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(500);
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{directionalInterface} = undef;
    $self->{velocityInterface} = undef;
    $self->{directionToKeyMap} = [$javax::microedition::lcdui::Canvas::LEFT, $javax::microedition::lcdui::Canvas::DOWN, $javax::microedition::lcdui::Canvas::UP, $javax::microedition::lcdui::Canvas::RIGHT];
    $self->{initialDropped} = 0;
    $self->{diveP} = 0;
    $self->{directionOfTarget} = 'org::allbinary::direction::Direction'->getInstance(0);
    $self->{MIN_DISTANCE} = 40;
    $self->{lastTrackingLayerInterface} = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
    $self->{artificialIntelligenceInterface} = undef;
    $self->{aiVistor} = undef;
    $self->{lastDirection} = 'org::allbinary::direction::DirectionFactory'->getInstance()->{NO_DIRECTION};
}


sub new {
    my ($class, $ownerLayerInterface, $artificialIntelligenceInterface, $gameInput, $visitor) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{aiVistor} = $visitor;
        $self->{artificialIntelligenceInterface} = $artificialIntelligenceInterface;
        my $directionalCompositeInterface = $self->getOwnerLayerInterface();
        $self->{directionalInterface} = $directionalCompositeInterface->getDirectionalInterface();
        my $velocityInterfaceCompositeInterface = $self->getOwnerLayerInterface();
        $self->{velocityInterface} = $velocityInterfaceCompositeInterface->getVelocityProperties();
        'org::allbinary::game::combat::destroy::event::DestroyedEventHandler'->getInstance()->addListenerInterface($self);
        $self->init();
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->isBeyondTarget()) {
            $self->init();
            $self->{velocityInterface}->zero();
        }
        if (!$self->{diveP}) {
            $self->target($allBinaryLayerManager);
        } else {
            $self->dive();
            $self->attack();
        }
        $self->{list}->clear();
}


sub init {
    my ($self) = @_;
        $self->{diveP} = 0;
        $self->{directionOfTarget} = 'org::allbinary::direction::DirectionFactory'->getInstance()->{NOT_BORDERED_WITH};
        'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->addListenerInterface($self);
}


# throws Exception
sub target {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->{list}->size() == 0) {
            return;
        }
        my $lastTrackingEvent = $self->{list}->removeAt(0);
        $self->{lastTrackingLayerInterface} = $lastTrackingEvent->getLayerInterface();
        my $layerInterface = $self->{lastTrackingLayerInterface};
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        if ($layerInterface->getGroupInterface() == $ownerLayerInterface->getGroupInterface()) {
            return;
        }
        my $x = $self->{lastTrackingLayerInterface}->getXP();
        my $y = $self->{lastTrackingLayerInterface}->getYP();
        my $yDistance = $ownerLayerInterface->getYP() - $y - $ownerLayerInterface->getHeight();
        my $xDistance = $ownerLayerInterface->getXP() - $x - $ownerLayerInterface->getWidth();
        my $directionFactory = 'org::allbinary::direction::DirectionFactory'->getInstance();
        if ($self->{mathUtil}->abs($yDistance) > $self->{mathUtil}->abs($xDistance)) {
            if ($yDistance > $self->{MIN_DISTANCE}) {
                $self->{directionOfTarget} = $directionFactory->{UP};
            } elsif ($yDistance < -$self->{MIN_DISTANCE}) {
                $self->{directionOfTarget} = $directionFactory->{DOWN};
            }
        } else {
            if ($xDistance > $self->{MIN_DISTANCE}) {
                $self->{directionOfTarget} = $directionFactory->{LEFT};
            } elsif ($xDistance < -$self->{MIN_DISTANCE}) {
                $self->{directionOfTarget} = $directionFactory->{RIGHT};
            }
        }
        if (!$self->{initialDropped} && $self->{directionOfTarget} != $directionFactory->{NOT_BORDERED_WITH}) {
            $self->drop();
        }
        if ($self->{initialDropped}) {
            if ($self->{directionOfTarget} == $directionFactory->{UP} || $self->{directionOfTarget} == $directionFactory->{DOWN}) {
                $self->verticalTargeting($x);
            } elsif ($self->{directionOfTarget} == $directionFactory->{LEFT} || $self->{directionOfTarget} == $directionFactory->{RIGHT}) {
                $self->horizontalTargeting($y);
            } else {
                $self->{artificialIntelligenceInterface}->processAI($allBinaryLayerManager);
            }
        }
}


# throws Exception
sub verticalTargeting {
    my ($self, $x) = @_;
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        if ($ownerLayerInterface->getXP() < $x) {
            $self->moveRight();
        }
        if ($ownerLayerInterface->getXP() > $x) {
            $self->moveLeft();
        }
        if ($ownerLayerInterface->getXP() > $x - 3 && $ownerLayerInterface->getXP() < $x + 3) {
            $self->setDive();
        }
}


# throws Exception
sub horizontalTargeting {
    my ($self, $y) = @_;
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        if ($ownerLayerInterface->getYP() < $y) {
            $self->moveDown();
        }
        if ($ownerLayerInterface->getYP() > $y) {
            $self->moveUp();
        }
        if ($ownerLayerInterface->getYP() > $y - 3 && $ownerLayerInterface->getYP() < $y + 3) {
            $self->setDive();
        }
}


sub setDive {
    my ($self) = @_;
        $self->{diveP} = 1;
        $self->{velocityInterface}->zero();
        'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->removeListener($self);
}


# throws Exception
sub moveRight {
    my ($self) = @_;
        $self->setLastDirection($self->{directionFactory}->{RIGHT});
        $self->{directionalInterface}->setFrameByDirection($self->{lastDirection});
        $self->{aiVistor}->visit($self);
}


# throws Exception
sub moveLeft {
    my ($self) = @_;
        $self->setLastDirection($self->{directionFactory}->{LEFT});
        $self->{directionalInterface}->setFrameByDirection($self->{lastDirection});
        $self->{aiVistor}->visit($self);
}


# throws Exception
sub moveDown {
    my ($self) = @_;
        $self->setLastDirection($self->{directionFactory}->{DOWN});
        $self->{directionalInterface}->setFrameByDirection($self->{lastDirection});
        $self->{aiVistor}->visit($self);
}


# throws Exception
sub moveUp {
    my ($self) = @_;
        $self->setLastDirection($self->{directionFactory}->{UP});
        $self->{directionalInterface}->setFrameByDirection($self->{lastDirection});
        $self->{aiVistor}->visit($self);
}


# throws Exception
sub dive {
    my ($self) = @_;
        $self->{directionalInterface}->setFrameByDirection($self->{directionOfTarget});
        $self->{aiVistor}->visit($self);
}


# throws Exception
sub attack {
    my ($self) = @_;
        $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_NUM1);
}


# throws Exception
sub drop {
    my ($self) = @_;
        if ($self->{timeDelayHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
            $self->{initialDropped} = 1;
            $self->{aiVistor}->visit($self);
        }
}


sub isBeyondTarget {
    my ($self) = @_;
        if ($self->{directionOfTarget} == $self->{directionFactory}->{DOWN}) {
            if ($self->getOwnerLayerInterface()->getYP() > $self->{lastTrackingLayerInterface}->getYP() + $self->{MIN_DISTANCE}) {
                return 1;
            } else {
                return 0;
            }
        } elsif ($self->{directionOfTarget} == $self->{directionFactory}->{UP}) {
            if ($self->getOwnerLayerInterface()->getYP() < $self->{lastTrackingLayerInterface}->getYP() + $self->{MIN_DISTANCE}) {
                return 1;
            } else {
                return 0;
            }
        } elsif ($self->{directionOfTarget} == $self->{directionFactory}->{RIGHT}) {
            if ($self->getOwnerLayerInterface()->getXP() > $self->{lastTrackingLayerInterface}->getXP() + $self->{MIN_DISTANCE}) {
                return 1;
            } else {
                return 0;
            }
        } elsif ($self->{directionOfTarget} == $self->{directionFactory}->{LEFT}) {
            if ($self->getOwnerLayerInterface()->getXP() < $self->{lastTrackingLayerInterface}->getXP() + $self->{MIN_DISTANCE}) {
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onMovement {
    my ($self, $trackingEvent) = @_;
        $self->{list}->add($trackingEvent);
}


sub onDestroyed {
    my ($self, $destroyedEvent) = @_;
        if ($self->getOwnerLayerInterface() == $destroyedEvent->getLayerInterface()) {
            'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->removeListener($self);
            'org::allbinary::game::combat::destroy::event::DestroyedEventHandler'->getInstance()->removeListener($self);
        }
}


sub setLastDirection {
    my ($self, $lastDirection) = @_;
        $self->{lastDirection} = $lastDirection;
        my $value = $self->getLastDirection()->getValue();
        if ($value < 4) {
            $self->SUPER::setLastKey($self->{directionToKeyMap}->[$value]);
        }
}


sub setLastKey {
    my ($self, $lastKey) = @_;
        $self->SUPER::setLastKey($lastKey);
        if ($self->getLastKey() == $javax::microedition::lcdui::Canvas::LEFT) {
            $self->{lastDirection} = 'org::allbinary::direction::DirectionFactory'->getInstance()->{LEFT};
        } elsif ($self->getLastKey() == $javax::microedition::lcdui::Canvas::DOWN) {
            $self->{lastDirection} = 'org::allbinary::direction::DirectionFactory'->getInstance()->{DOWN};
        } elsif ($self->getLastKey() == $javax::microedition::lcdui::Canvas::UP) {
            $self->{lastDirection} = 'org::allbinary::direction::DirectionFactory'->getInstance()->{UP};
        } elsif ($self->getLastKey() == $javax::microedition::lcdui::Canvas::RIGHT) {
            $self->{lastDirection} = 'org::allbinary::direction::DirectionFactory'->getInstance()->{RIGHT};
        }
}


sub getLastDirection {
    my ($self) = @_;
        return $self->{lastDirection};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->SUPER::toString());
        $stringBuffer->append(" LastDirection: ");
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->getLastDirection()));
        return $stringBuffer->toString();
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::direction::DirectionalCompositeInterface;
use org::allbinary::direction::DirectionalInterface;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::combat::destroy::event::DestroyedEvent;
use org::allbinary::game::combat::destroy::event::DestroyedEventHandler;
use org::allbinary::game::combat::destroy::event::DestroyedEventListenerInterface;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::game::physics::velocity::VelocityInterfaceCompositeInterface;
use org::allbinary::game::tracking::TrackingEvent;
use org::allbinary::game::tracking::TrackingEventHandler;
use org::allbinary::game::tracking::TrackingEventListenerInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::math::MathUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

