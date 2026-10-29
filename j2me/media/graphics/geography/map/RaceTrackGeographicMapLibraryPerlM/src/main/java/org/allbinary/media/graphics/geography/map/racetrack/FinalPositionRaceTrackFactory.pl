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

package org::allbinary::media::graphics::geography::map::racetrack::FinalPositionRaceTrackFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $FIRST_POSITION = 1;
our $index = $org::allbinary::media::graphics::geography::map::racetrack::FinalPositionRaceTrackFactory::FIRST_POSITION;


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::racetrack::FinalPositionRaceTrackFactory::index++;
}


sub reset {
    my ($class) = @_;
        $org::allbinary::media::graphics::geography::map::racetrack::FinalPositionRaceTrackFactory::index = $org::allbinary::media::graphics::geography::map::racetrack::FinalPositionRaceTrackFactory::FIRST_POSITION;
}


1;

