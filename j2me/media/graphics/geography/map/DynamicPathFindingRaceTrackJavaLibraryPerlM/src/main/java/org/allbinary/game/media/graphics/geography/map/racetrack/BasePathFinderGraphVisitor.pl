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
        for (my $index = $startPathFindingNodeList->size() - 1; $index >= 0; $index--) {
            my $startPathFindingNode = $startPathFindingNodeList->get($index);
            $pathList->remove($startPathFindingNode->{geographicMapCellPosition});
            $pathList->addAt(0, $startPathFindingNode->{geographicMapCellPosition});
        }
}


sub isValid {
    my ($self, $graphPath) = @_;
        if ($graphPath->getEdgeList()->size() > $self->{edgeMinimum} && $graphPath->getWeight() < $self->{maxPathWeight} && $graphPath->getWeight() > $self->{minPathWeight}) {
            return 1;
        } else {
            return 0;
        }
}


sub getInvalidReason {
    my ($self, $graphPath) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if ($graphPath->getEdgeList()->size() < $self->{edgeMinimum}) {
            $stringBuffer->append("Ignoring Small: " . $graphPath->getEdgeList()->size());
        }
        if ($graphPath->getWeight() <= $self->{minPathWeight}) {
            $stringBuffer->append(" Low Weighted Path: " . $graphPath->getWeight());
        }
        if ($graphPath->getWeight() >= $self->{maxPathWeight}) {
            $stringBuffer->append(" To High Weighted Path: " . $graphPath->getWeight());
        }
        return $stringBuffer->toString();
}

use org::jgrapht::GraphPath;
use org::jgrapht::graph::SimpleWeightedGraph;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::pathfinding::PathFinderGraphVisitorBase;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNode;
use org::allbinary::util::BasicArrayList;

1;

