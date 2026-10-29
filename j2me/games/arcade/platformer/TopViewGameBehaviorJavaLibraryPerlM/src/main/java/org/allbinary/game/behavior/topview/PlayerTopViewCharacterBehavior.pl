# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::behavior::topview::PlayerTopViewCharacterBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::behavior::topview::TopViewCharacterBehavior';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub terrainEvent {
    my ($self, $layer, $direction, $x, $y, $geographicMapInterfaceArray, $geographicMapCellPosition) = @_;
        'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->fireEvent('org::allbinary::game::tracking::TrackingEventCircularStaticPool'->getInstance()->getNextInstance($layer));
}


sub terrainMove {
    my ($self, $layer, $geographicMapInterfaceArray, $x, $y) = @_;
        my $basicGeographicMapUtil = 'org::allbinary::media::graphics::geography::map::BasicGeographicMapUtil'->getInstance();
        $basicGeographicMapUtil->setPosition($geographicMapInterfaceArray, $x, $y);
}


sub moveIfOnScreen {
    my ($self, $layer, $ax, $ay) = @_;
}


sub isTiledLayerMoveable {
    my ($self, $terrainTiledLayer, $x, $y) = @_;
        return ($terrainTiledLayer->getXP() + 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->getLastWidth() < $terrainTiledLayer->getWidth() || $x < 0) && ($terrainTiledLayer->getXP() > 0 || $x > 0);
}

use org::allbinary::direction::Direction;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::tracking::TrackingEventCircularStaticPool;
use org::allbinary::game::tracking::TrackingEventHandler;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::game::behavior::topview::TopViewCharacterBehavior;

1;

