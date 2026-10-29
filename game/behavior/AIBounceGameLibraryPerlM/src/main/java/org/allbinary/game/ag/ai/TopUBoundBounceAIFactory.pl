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

package org::allbinary::game::ag::ai::TopUBoundBounceAIFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $hashtable, $ownerLayerInterface, $gameInput) = @_;
        my $velocityInterfaceCompositeInterface = $ownerLayerInterface;
        my $velocityInterface = $velocityInterfaceCompositeInterface->getVelocityProperties();
        my $maxDistancePerTick = (POSIX::floor(($velocityInterface->getMaxForwardVelocity()) / (2 ** ($velocityInterface->getVelocityXBasicDecimalP()->getScaledFactor()))));
        my $halfWidth = $ownerLayerInterface->getWidth() * 2 + $maxDistancePerTick + 1;
        my $halfHeight = $ownerLayerInterface->getHeight() * 2 + $maxDistancePerTick + 1;
        my $point = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($halfWidth, $halfHeight + 60);
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $rectangle = 'org::allbinary::graphics::Rectangle'->new($point, ($displayInfo->getLastWidth() - $halfWidth - $point->getX()), ($displayInfo->getLastHeight() - $halfHeight - $point->getY()));
        return 'org::allbinary::game::ag::ai::BoundBounceAI'->new($ownerLayerInterface, $gameInput, 'org::allbinary::bounds::TopULayerBounds'->new($rectangle), 'org::allbinary::game::ag::ai::ReverseVelocityBoundsVisitor'->new($ownerLayerInterface));
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::bounds::TopULayerBounds;
use org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::physics::velocity::VelocityInterface;
use org::allbinary::game::physics::velocity::VelocityInterfaceCompositeInterface;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::ag::ai::BoundBounceAI;
use org::allbinary::game::ag::ai::ReverseVelocityBoundsVisitor;

1;

