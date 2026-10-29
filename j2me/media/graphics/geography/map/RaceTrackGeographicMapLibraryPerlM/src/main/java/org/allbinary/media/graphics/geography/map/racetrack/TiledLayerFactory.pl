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

package org::allbinary::media::graphics::geography::map::racetrack::TiledLayerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self, $raceTrackData) = @_;
        my $mapArray = $raceTrackData->getMapArray();
        return 'javax::microedition::lcdui::game::TiledLayer'->new(scalar(@{$mapArray->[0]}), scalar(@{$mapArray}), $raceTrackData->getTileSetImage(), $raceTrackData->getCellWidth(), $raceTrackData->getCellHeight());
}


sub getMiniInstance {
    my ($self, $raceTrackData) = @_;
        my $mapArray = $raceTrackData->getMapArray();
        return 'javax::microedition::lcdui::game::TiledLayer'->new(scalar(@{$mapArray->[0]}), scalar(@{$mapArray}), $raceTrackData->getMiniTileSetImage(), $raceTrackData->getMiniCellWidth(), $raceTrackData->getMiniCellHeight());
}

# use javax::microedition::lcdui::game::TiledLayer;

1;

