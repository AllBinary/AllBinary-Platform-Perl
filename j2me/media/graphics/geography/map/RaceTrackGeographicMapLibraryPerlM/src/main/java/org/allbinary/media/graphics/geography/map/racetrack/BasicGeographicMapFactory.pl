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

package org::allbinary::media::graphics::geography::map::racetrack::BasicGeographicMapFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $raceTrackInfo, $raceTrackData, $tiledLayerFactoryInterface, $geographicMapCellPositionFactoryInterface, $geographicMapCellTypeFactory) = @_;
        return 'org::allbinary::media::graphics::geography::map::BasicGeographicMap'->new('org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(int($raceTrackInfo->getId()) + 100 + 1), $raceTrackInfo->getName(), $raceTrackData->getCellTypeIdToGeographicMapCellTypeArray(), $tiledLayerFactoryInterface->getMiniInstance($raceTrackData), 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{CLEAR_COLOR}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{CLEAR_COLOR}, $geographicMapCellPositionFactoryInterface, 'org::allbinary::media::graphics::geography::map::GeographicMapCellPositionBaseFactory'->new(), $geographicMapCellTypeFactory);
}

use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionBaseFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInterface;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;

1;

