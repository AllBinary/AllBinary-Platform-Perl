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

package org::allbinary::media::graphics::geography::pathfinding::PathGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::PathGeneratorInterface';

our $SINGLETON = 'org::allbinary::media::graphics::geography::pathfinding::PathGenerator'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::pathfinding::PathGenerator::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub init {
    my ($self, $geographicMapInterface, $totalPaths) = @_;
}


# throws Exception
sub getInstanceNoCache {
    my ($self, $geographicMapInterface, $pathFindingInfo, $totalPaths) = @_;
        my $geographicMapCellPositionBasicArrayList = $self->create($geographicMapInterface, $pathFindingInfo, $totalPaths);
        return $geographicMapCellPositionBasicArrayList;
}


# throws Exception
sub createList {
    my ($self, $geographicMapInterface, $geographicMapCellHistory, $pathFindingInfo, $totalPaths) = @_;
        die ("RuntimeException");
}


# throws Exception
sub create {
    my ($self, $geographicMapInterface, $pathFindingInfo, $totalPaths) = @_;
        my $startPathFindingNodeList = $pathFindingInfo->getStartPathFindingNodeList();
        my $endPathFindingNodeList = $pathFindingInfo->getEndPathFindingNodeList();
        my $geographicPathFinderInterface = $pathFindingInfo->getPathFinder();
        my $geographicMapCellPositionBasicArrayList = $geographicPathFinderInterface->searchTotalPath($startPathFindingNodeList, $endPathFindingNodeList, $totalPaths);
        return $geographicMapCellPositionBasicArrayList;
}


# throws Exception
sub createN {
    my ($self, $geographicMapInterface, $pathFindingInfo, $totalPaths, $multipassState) = @_;
        my $startPathFindingNodeList = $pathFindingInfo->getStartPathFindingNodeList();
        my $endPathFindingNodeList = $pathFindingInfo->getEndPathFindingNodeList();
        my $geographicPathFinderInterface = $pathFindingInfo->getPathFinder();
        my $geographicMapCellPositionBasicArrayList = $geographicPathFinderInterface->searchTotalPathN($startPathFindingNodeList, $endPathFindingNodeList, $totalPaths, $multipassState);
        return $geographicMapCellPositionBasicArrayList;
}


# throws Exception
sub isValid {
    my ($self, $pathList, $geographicMapCellHistory) = @_;
        die ("RuntimeException");
}

use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::util::BasicArrayList;
use org::allbinary::media::graphics::geography::pathfinding::PathGeneratorInterface;

1;

