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

package org::allbinary::game::layer::AllBinaryTiledLayerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::AllBinaryTiledLayerFactoryInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $raceTrackInfo, $raceTrackData) = @_;
        my $allbinaryTiledLayer = undef;
        my $tiledLayer = 'org::allbinary::media::graphics::geography::map::racetrack::TiledLayerFactory'->new()->getInstance($raceTrackData);
        $allbinaryTiledLayer = 'org::allbinary::game::layer::AllBinaryJ2METiledLayer'->new($raceTrackData->getId(), $tiledLayer, $raceTrackData->getMapArray(), int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED}));
        $allbinaryTiledLayer->setCells($raceTrackData->getMapArray());
        return $allbinaryTiledLayer;
}


# throws Exception
sub getMiniInstance {
    my ($self, $raceTrackData) = @_;
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $tiledLayer = 'org::allbinary::media::graphics::geography::map::racetrack::TiledLayerFactory'->new()->getMiniInstance($raceTrackData);
        my $allbinaryTiledLayer = 'org::allbinary::game::layer::AllBinaryJ2METiledLayer'->new($smallIntegerSingletonFactory->getAt(int($raceTrackData->getId()) + 100 + 1), $tiledLayer, $raceTrackData->getMapArray(), int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED}));
        $allbinaryTiledLayer->setCells($raceTrackData->getMapArray());
        return $allbinaryTiledLayer;
}

# use javax::microedition::lcdui::game::TiledLayer;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::graphics::geography::map::racetrack::AllBinaryTiledLayerFactoryInterface;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackData;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackInfo;
use org::allbinary::media::graphics::geography::map::racetrack::TiledLayerFactory;
use org::allbinary::game::layer::AllBinaryJ2METiledLayer;

1;

