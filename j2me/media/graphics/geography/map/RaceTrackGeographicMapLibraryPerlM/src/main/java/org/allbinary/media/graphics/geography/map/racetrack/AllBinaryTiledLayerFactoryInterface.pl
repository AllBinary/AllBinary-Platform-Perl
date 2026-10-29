# Generated Code Do Not Modify

# Java interface
package org::allbinary::media::graphics::geography::map::racetrack::AllBinaryTiledLayerFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub getInstance {
    my ($self, $raceTrackInfo, $raceTrackData) = @_;
    die "abstract method getInstance";
}


# throws Exception
sub getMiniInstance {
    my ($self, $raceTrackData) = @_;
    die "abstract method getMiniInstance";
}

use org::allbinary::game::layer::AllBinaryTiledLayer;

1;

