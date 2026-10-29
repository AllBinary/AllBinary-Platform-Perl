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

package org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::BasePathFindingInfoFactory';

our $instance = 'org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws Exception
sub getInstancePathFindingInfo {
    my ($self, $geographicMapInterface, $graphArray) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        'org::allbinary::logic::communication::log::PreLogUtil'->put($commonStrings->{START}, $self, $commonStrings->{GET_INSTANCE});
        my $pathFindingInfo = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo'->new('org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase'->new(), 'org::allbinary::util::BasicArrayListS'->new(1), 'org::allbinary::util::BasicArrayListS'->new(1));
        'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory'->getInstance()->init();
        $self->init($geographicMapInterface, $pathFindingInfo, $graphArray);
        return $pathFindingInfo;
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::racetrack::BasePathFindingInfoFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase;
use org::allbinary::util::BasicArrayListS;

1;

