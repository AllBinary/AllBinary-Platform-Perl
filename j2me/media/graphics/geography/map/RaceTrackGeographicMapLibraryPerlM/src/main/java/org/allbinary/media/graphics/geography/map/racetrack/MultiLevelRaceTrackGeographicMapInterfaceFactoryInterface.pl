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

# Java interface
package org::allbinary::media::graphics::geography::map::racetrack::MultiLevelRaceTrackGeographicMapInterfaceFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapInterfaceFactoryInterface';



# throws Exception
sub getFirstWaveWithTrack {
    my ($self, $track) = @_;
    die "abstract method getFirstWaveWithTrack";
}


sub getTotalTracks {
    my ($self) = @_;
    die "abstract method getTotalTracks";
}


sub getTotalLevels {
    my ($self) = @_;
    die "abstract method getTotalLevels";
}

use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapInterfaceFactoryInterface;

1;

