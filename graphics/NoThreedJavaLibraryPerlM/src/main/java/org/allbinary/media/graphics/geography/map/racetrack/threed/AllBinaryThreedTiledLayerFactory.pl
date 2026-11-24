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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::media::graphics::geography::map::racetrack::threed::AllBinaryThreedTiledLayerFactory'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::racetrack::threed::AllBinaryThreedTiledLayerFactory::instance;
}


# throws Exception
sub getInstance_j2 {
    my ($self, $raceTrackInfo, $raceTrackData) = @_;
        die ("No Threed");
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::layer::AllBinaryTiledLayer ();
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackData ();
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackInfo ();

1;

