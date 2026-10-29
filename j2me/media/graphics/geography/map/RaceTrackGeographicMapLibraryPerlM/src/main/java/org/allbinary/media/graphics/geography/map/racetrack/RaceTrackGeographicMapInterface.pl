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
package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapInterface';



sub getRaceTrackInfo {
    my ($self) = @_;
    die "abstract method getRaceTrackInfo";
}


sub setRaceTrackInfo {
    my ($self, $aRaceTrackInfo) = @_;
    die "abstract method setRaceTrackInfo";
}


sub getRaceTrackData {
    my ($self) = @_;
    die "abstract method getRaceTrackData";
}


sub setRaceTrackData {
    my ($self, $raceTrackData) = @_;
    die "abstract method setRaceTrackData";
}

use org::allbinary::media::graphics::geography::map::GeographicMapInterface;

1;

