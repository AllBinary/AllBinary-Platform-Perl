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

package org::allbinary::game::ag::ai::tactical::LurchAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';


sub _init_fields {
    my ($self) = @_;
    $self->{currentRelativeAngle} = 0;
    $self->{currentSpeed} = 0;
}


sub new {
    my ($class, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->{currentSpeed} == -1) {
            $self->{currentSpeed} = 5;
        } else {
            $self->{currentSpeed} = -1;
        }
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        my $x = $ownerLayerInterface->getXP();
        if ($ownerLayerInterface->getXP() - $self->{currentSpeed} <= 0) {
            $self->reverse();
            $self->drop();
        }
        if ($ownerLayerInterface->getX2() + $self->{currentSpeed} > 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->getLastWidth()) {
            $self->reverse();
            $self->accelerate();
            $self->drop();
        }
        if ($self->{currentRelativeAngle} == 0) {
            $x += $self->{currentSpeed};
        } elsif ($self->{currentRelativeAngle} == 180) {
            $x -= $self->{currentSpeed};
        }
        $ownerLayerInterface->setPosition($x, $ownerLayerInterface->getYP(), $ownerLayerInterface->getZP());
        if ($self->{currentRelativeAngle} == 0) {
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_NUM0);
        } elsif ($self->{currentRelativeAngle} == 180) {
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_POUND);
        }
}


sub reverse {
    my ($self) = @_;
        if ($self->{currentRelativeAngle} == 180) {
            $self->{currentRelativeAngle} = 0;
        } elsif ($self->{currentRelativeAngle} == 0) {
            $self->{currentRelativeAngle} = 180;
        }
}


sub accelerate {
    my ($self) = @_;
        if ($self->{currentSpeed} < 20) {
            $self->{currentSpeed}++;
        }
}


sub drop {
    my ($self) = @_;
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        my $y = $ownerLayerInterface->getYP();
        if ($ownerLayerInterface->getY2() + $ownerLayerInterface->getHeight() > 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->getLastHeight()) {
            $y = 0;
        } else {
            $y += $ownerLayerInterface->getHeight() + 1;
        }
        $ownerLayerInterface->setPosition($ownerLayerInterface->getXP(), $y, $ownerLayerInterface->getZP());
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;

1;

