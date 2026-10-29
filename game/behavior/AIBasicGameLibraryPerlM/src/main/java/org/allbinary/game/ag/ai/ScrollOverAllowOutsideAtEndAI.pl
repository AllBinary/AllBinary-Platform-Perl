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

package org::allbinary::game::ag::ai::ScrollOverAllowOutsideAtEndAI;
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
        my $x = $ownerLayerInterface->getXP();
        my $y = $ownerLayerInterface->getYP();
        my $width = $ownerLayerInterface->getWidth();
        my $height = $ownerLayerInterface->getHeight();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        if ($x > $displayInfo->getLastWidth()) {
            $ownerLayerInterface->setPosition(-$width, $y, $ownerLayerInterface->getZP());
        }
        if ($y > $displayInfo->getLastHeight()) {
            $ownerLayerInterface->setPosition($x, -$height, $ownerLayerInterface->getZP());
        }
        if ($x < -$width) {
            $ownerLayerInterface->setPosition($displayInfo->getLastWidth() + $width, $y, $ownerLayerInterface->getZP());
        }
        if ($y < -$height) {
            $ownerLayerInterface->setPosition($x, $displayInfo->getLastHeight() + $height, $ownerLayerInterface->getZP());
        }
}

use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;

1;

