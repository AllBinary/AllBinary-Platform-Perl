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

package org::allbinary::game::ag::ai::StopAtEdgeAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';



sub new {
    my ($class, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        my $ownerLayerInterface = $self->getOwnerLayerInterface();
        my $velocityInterfaceCompositeInterface = ($ownerLayerInterface);
        my $velocityProperties = $velocityInterfaceCompositeInterface->getVelocityProperties();
        my $x = $ownerLayerInterface->getXP();
        my $y = $ownerLayerInterface->getYP();
        my $x2 = $ownerLayerInterface->getX2();
        my $y2 = $ownerLayerInterface->getY2();
        my $width = $ownerLayerInterface->getWidth();
        my $height = $ownerLayerInterface->getHeight();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        if ($x2 + $velocityProperties->getVelocityXBasicDecimalP()->getScaled() > $displayInfo->getLastWidth()) {
            $ownerLayerInterface->setPosition($displayInfo->getLastWidth() - $width, $y, $ownerLayerInterface->getZP());
            $velocityProperties->getVelocityYBasicDecimalP()->setint(0);
        }
        if ($y2 + $velocityProperties->getVelocityYBasicDecimalP()->getScaled() > $displayInfo->getLastHeight()) {
            $ownerLayerInterface->setPosition($x, $displayInfo->getLastHeight() - $height, $ownerLayerInterface->getZP());
            $velocityProperties->getVelocityXBasicDecimalP()->setint(0);
        }
        if ($x + $velocityProperties->getVelocityXBasicDecimalP()->getScaled() < 0) {
            $ownerLayerInterface->setPosition(0, $y, $ownerLayerInterface->getZP());
            $velocityProperties->getVelocityYBasicDecimalP()->setint(0);
        }
        if ($y + $velocityProperties->getVelocityYBasicDecimalP()->getScaled() < 0) {
            $ownerLayerInterface->setPosition($x, 0, $ownerLayerInterface->getZP());
            $velocityProperties->getVelocityXBasicDecimalP()->setint(0);
        }
}

use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::game::physics::velocity::VelocityInterfaceCompositeInterface;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;

1;

