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

#1.4.2
package org::allbinary::game::media::graphics::geography::map::racetrack::BasePathFinderGraphVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::PathFinderGraphVisitorBase';


sub _init_fields {
    my ($self) = @_;
    $self->{geographicMapInterface} = undef;
    $self->{edgeMinimum} = undef;
    $self->{minPathWeight} = undef;
    $self->{maxPathWeight} = undef;
}


sub new {
    my ($class, $geographicMapInterface, $edgeMinimum, $minPathWeight, $maxPathWeight) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{geographicMapInterface} = $geographicMapInterface;
        $self->{edgeMinimum} = $edgeMinimum;
        $self->{minPathWeight} = $minPathWeight;
        $self->{maxPathWeight} = $maxPathWeight;
    return $self;
}


# throws Exception
sub visit {
    my ($self, $graph, $startPathFindingNodeList, $endPathFindingNodeList) = @_;
}


# throws Exception
sub fixPath {
    my ($self, $startPathFindingNodeList, $endPathFindingNodeList, $pathList) = @_;
        my $startPathFindingNode = undef;
        for (my $index = $startPathFindingNodeList->size() - 1; $index >= 0; $index--) {
            $startPathFindingNode = $startPathFindingNodeList->get($index);
            $pathList->remove($startPathFindingNode->{geographicMapCellPosition});
            $pathList->addAt(0, $startPathFindingNode->{geographicMapCellPosition});
        }
}


sub isValid {
    my ($self, $graphPath) = @_;
        return 0;
}


sub getInvalidReason {
    my ($self, $graphPath) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::pathfinding::PathFinderGraphVisitorBase;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNode;
use org::allbinary::util::BasicArrayList;

1;

