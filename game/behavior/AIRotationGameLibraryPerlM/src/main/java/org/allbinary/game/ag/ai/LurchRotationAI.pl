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

package org::allbinary::game::ag::ai::LurchRotationAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::ai::tactical::LurchAI';


sub _init_fields {
    my ($self) = @_;
    $self->{rotationAnimationInterface} = undef;
}


sub new {
    my ($class, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        my $rotationAnimationInterfaceCompositeInterface = $self->getOwnerLayerInterface();
        $self->{rotationAnimationInterface} = $rotationAnimationInterfaceCompositeInterface->getRotationAnimationInterface();
        $self->update();
    return $self;
}


sub reverse {
    my ($self) = @_;
        $self->SUPER::reverse();
        $self->update();
}


sub update {
    my ($self) = @_;
        if ($self->{currentRelativeAngle} == 0) {
            my $rotationAnimationInterface = $self->{rotationAnimationInterface};
            my $angleIncrementInfo = $rotationAnimationInterface->getAngleInfoP()->getAngleIncrementInfo();
            my $rotationAnimationInterfaceCompositeInterface = $self->getOwnerLayerInterface();
            $rotationAnimationInterfaceCompositeInterface->setFrame(int($angleIncrementInfo->{RIGHT_FRAME}));
        } elsif ($self->{currentRelativeAngle} == 180) {
            my $rotationAnimationInterface = $self->{rotationAnimationInterface};
            my $angleIncrementInfo = $rotationAnimationInterface->getAngleInfoP()->getAngleIncrementInfo();
            my $rotationAnimationInterfaceCompositeInterface = $self->getOwnerLayerInterface();
            $rotationAnimationInterfaceCompositeInterface->setFrame(int($angleIncrementInfo->{LEFT_FRAME}));
        }
}

use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::RotationAnimationInterface;
use org::allbinary::animation::RotationAnimationInterfaceCompositeInterface;
use org::allbinary::game::ag::ai::tactical::LurchAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::math::AngleIncrementInfo;

1;

