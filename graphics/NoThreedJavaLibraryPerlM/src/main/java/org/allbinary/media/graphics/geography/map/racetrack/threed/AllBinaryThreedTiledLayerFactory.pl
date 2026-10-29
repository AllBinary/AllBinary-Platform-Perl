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

package org::allbinary::media::graphics::geography::map::racetrack::threed::AllBinaryThreedTiledLayerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::graphics::geography::map::racetrack::threed::AllBinaryThreedTiledLayerFactory'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::racetrack::threed::AllBinaryThreedTiledLayerFactory::instance;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $raceTrackInfo, $raceTrackData) = @_;
        die ("No Threed");
}

use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackData;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackInfo;

1;

