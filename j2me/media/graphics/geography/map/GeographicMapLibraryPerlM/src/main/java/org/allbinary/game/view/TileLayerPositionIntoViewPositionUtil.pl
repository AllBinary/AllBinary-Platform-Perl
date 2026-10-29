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

package org::allbinary::game::view::TileLayerPositionIntoViewPositionUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($class, $gameCanvasInterface, $viewPosition) = @_;
        my $geographicMapCompositeInterface = $gameCanvasInterface->getLayerManager();
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        $viewPosition->setTiledLayer($tiledLayer);
}

use org::allbinary::game::view::TileLayerPositionIntoViewPosition;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;

1;

