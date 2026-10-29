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

package org::allbinary::game::ag::ai::HorizontaRotationManeuverAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI','org::allbinary::ai::ArtificialIntelligenceTransitionInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstanceAt(10, 2147483647);
    $self->{currentSpeedDivisor} = 5;
    $self->{rotationAnimationInterface} = undef;
    $self->{baseVelocityInterface} = undef;
    $self->{velocityInterface} = undef;
}


sub new {
    my ($class, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        my $rotationAnimationInterfaceCompositeInterface = $self->getOwnerLayerInterface();
        $self->{rotationAnimationInterface} = $rotationAnimationInterfaceCompositeInterface->getRotationAnimationInterface();
        my $velocityInterfaceCompositeInterface = $self->getOwnerLayerInterface();
        $self->{baseVelocityInterface} = $velocityInterfaceCompositeInterface->getVelocityProperties();
        $self->{velocityInterface} = $self->{baseVelocityInterface};
        my $rotationAnimationInterface = $self->{rotationAnimationInterface};
        my $angleIncrementInfo = $rotationAnimationInterface->getAngleInfoP()->getAngleIncrementInfo();
        $rotationAnimationInterfaceCompositeInterface->setFrame(int($angleIncrementInfo->{RIGHT_FRAME}));
    return $self;
}


sub transition {
    my ($self) = @_;
        my $rotationAnimationInterface = $self->{rotationAnimationInterface};
        my $angleIncrementInfo = $rotationAnimationInterface->getAngleInfoP()->getAngleIncrementInfo();
        my $rotationAnimationInterfaceCompositeInterface = $self->getOwnerLayerInterface();
        $rotationAnimationInterfaceCompositeInterface->setFrame(int($angleIncrementInfo->{RIGHT_FRAME}));
        my $allbinaryLayer = $self->getOwnerLayerInterface();
        $allbinaryLayer->setPosition($allbinaryLayer->getXP(), 1, $allbinaryLayer->getZP());
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        my $rotationAnimationInterface = ($self->{rotationAnimationInterface});
        my $angleIncrementInfo = $rotationAnimationInterface->getAngleInfoP()->getAngleIncrementInfo();
        my $frame = $self->{rotationAnimationInterface}->getFrame();
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        if ($ownerLayerInterface->getXP() - $ownerLayerInterface->getWidth() <= 0 && $frame == int($angleIncrementInfo->{LEFT_FRAME})) {
            $self->reverse();
            $self->drop();
        }
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        if ($ownerLayerInterface->getX2() + $ownerLayerInterface->getWidth() > $displayInfo->getLastWidth() && $frame == int($angleIncrementInfo->{RIGHT_FRAME})) {
            $self->reverse();
            $self->accelerate();
            $self->drop();
        }
        my $index = $self->{circularIndexUtil}->getIndex();
        if ($index % $self->{currentSpeedDivisor} == 0 && $index % 2 == 0) {
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::UP);
            $self->{velocityInterface}->limitMaxXYVelocity($self->{velocityInterface}->getMaxForwardVelocity() / $self->{currentSpeedDivisor});
        }
        $self->{circularIndexUtil}->next();
        if ($frame == int($angleIncrementInfo->{LEFT_FRAME})) {
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_NUM0);
        } elsif ($frame == int($angleIncrementInfo->{RIGHT_FRAME})) {
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_POUND);
        }
}


sub reverse {
    my ($self) = @_;
        my $rotationAnimationInterface = $self->{rotationAnimationInterface};
        my $angleIncrementInfo = $rotationAnimationInterface->getAngleInfoP()->getAngleIncrementInfo();
        my $frame = $self->{rotationAnimationInterface}->getFrame();
        if ($frame == int($angleIncrementInfo->{LEFT_FRAME})) {
            my $rotationAnimationInterfaceCompositeInterface = $self->getOwnerLayerInterface();
            $rotationAnimationInterfaceCompositeInterface->setFrame(int($angleIncrementInfo->{RIGHT_FRAME}));
            $self->{baseVelocityInterface}->zero();
        } elsif ($frame == int($angleIncrementInfo->{RIGHT_FRAME})) {
            my $rotationAnimationInterfaceCompositeInterface = $self->getOwnerLayerInterface();
            $rotationAnimationInterfaceCompositeInterface->setFrame(int($angleIncrementInfo->{LEFT_FRAME}));
            $self->{baseVelocityInterface}->zero();
        }
}


sub accelerate {
    my ($self) = @_;
        if ($self->{currentSpeedDivisor} > 1) {
            $self->{currentSpeedDivisor}--;
        }
}


sub drop {
    my ($self) = @_;
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        my $y = $ownerLayerInterface->getYP();
        if ($ownerLayerInterface->getY2() + $ownerLayerInterface->getHeight() > $displayInfo->getLastHeight()) {
            $y = 0;
        } else {
            $y += $ownerLayerInterface->getHeight() + 1;
        }
        $ownerLayerInterface->setPosition($ownerLayerInterface->getXP(), $y, $ownerLayerInterface->getZP());
}


sub getId {
    my ($self) = @_;
        return $org::allbinary::ai::ArtificialIntelligence::AI_ID;
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::ai::ArtificialIntelligence;
use org::allbinary::ai::ArtificialIntelligenceTransitionInterface;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::RotationAnimationInterface;
use org::allbinary::animation::RotationAnimationInterfaceCompositeInterface;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::game::physics::velocity::VelocityInterface;
use org::allbinary::game::physics::velocity::VelocityInterfaceCompositeInterface;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::math::AngleIncrementInfo;
use org::allbinary::util::CircularIndexUtil;

1;

