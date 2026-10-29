# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot  
# Generated Code Do Not Modify

package org::allbinary::game::layer::AdvancedRTSLayerUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::AdvancedRTSLayerUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::AdvancedRTSLayerUtil::instance;
}


sub createFakeRTSLayerHashtable {
    my ($self, $baseRaceTrackGeographicMap) = @_;
        my $hashtable = 'org::allbinary::game::layer::RTSLayerUtil'->getInstance()->createFakeRTSLayerHashtable($baseRaceTrackGeographicMap);
        $hashtable->put($org::allbinary::game::layer::waypoint::WorkWaypoint::ID, 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(50));
        return $hashtable;
}

use org::allbinary::game::layer::waypoint::WorkWaypoint;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::graphics::geography::map::racetrack::BaseRaceTrackGeographicMap;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::layer::RTSLayerUtil;

1;

