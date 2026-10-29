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
package org::allbinary::game::media::graphics::geography::map::racetrack::PathFinderGraphHackVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::media::graphics::geography::map::racetrack::BasePathFinderGraphVisitor';



sub new {
    my ($class, $geographicMapInterface, $edgeMinimum, $minPathWeight, $maxPathWeight) = @_;
    my $self = $class->SUPER::new($geographicMapInterface, $edgeMinimum, $minPathWeight, $maxPathWeight);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub visit {
    my ($self, $graph, $startPathFindingNodeList, $endPathFindingNodeList) = @_;
        $self->fixStart($graph, $startPathFindingNodeList);
        $self->fixEnd($graph, $endPathFindingNodeList);
        $self->fixOverPassEdges($graph);
}


# throws Exception
sub fixStart {
    my ($self, $graph, $startPathFindingNodeList) = @_;
}


# throws Exception
sub fixEnd {
    my ($self, $graph, $endPathFindingNodeList) = @_;
}


# throws Exception
sub fixOverPassEdges {
    my ($self, $graph) = @_;
}


# throws Exception
sub fixPath {
    my ($self, $startPathFindingNodeList, $endPathFindingNodeList, $pathList) = @_;
}


# throws Exception
sub removeOverPassEdges {
    my ($self, $pathList) = @_;
}


sub isValid {
    my ($self, $graphPath) = @_;
        return 0;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::game::media::graphics::geography::map::racetrack::BasePathFinderGraphVisitor;

1;

