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

package org::allbinary::game::ag::ai::BoundBounceAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';


sub _init_fields {
    my ($self) = @_;
    $self->{currentRelativeAngle} = 0;
    $self->{layerBounds} = undef;
    $self->{boundsVisitorInterface} = undef;
}


sub new {
    my ($class, $ownerLayerInterface, $gameInput, $layerBounds, $boundsVisitorInterface) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{layerBounds} = $layerBounds;
        $self->{boundsVisitorInterface} = $boundsVisitorInterface;
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        my $rectange = $self->{layerBounds}->getRectangleP();
        $graphics->drawRect($rectange->getPoint()->getX(), $rectange->getPoint()->getY(), $rectange->getWidth(), $rectange->getHeight());
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        $self->{layerBounds}->visit($self->{boundsVisitorInterface});
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::bounds::BoundsVisitorInterface;
use org::allbinary::bounds::LayerBounds;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::graphics::Rectangle;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;

1;

