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

package org::allbinary::game::media::graphics::geography::map::racetrack::SimplePathFinderGraphVisitorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::PathFinderGraphVisitorFactoryBase';


sub _init_fields {
    my ($self) = @_;
    $self->{edgeMinimum} = undef;
    $self->{minPathWeight} = undef;
    $self->{maxPathWeight} = undef;
}


sub new {
    my ($class, $edgeMinimum, $minPathWeight, $maxPathWeight) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{edgeMinimum} = $edgeMinimum;
        $self->{minPathWeight} = $minPathWeight;
        $self->{maxPathWeight} = $maxPathWeight;
    return $self;
}


sub getInstance {
    my ($self, $geographicMapInterface) = @_;
        return 'org::allbinary::game::media::graphics::geography::map::racetrack::BasePathFinderGraphVisitor'->new($geographicMapInterface, $self->{edgeMinimum}, $self->{minPathWeight}, $self->{maxPathWeight});
}

use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::pathfinding::PathFinderGraphVisitorFactoryBase;
use org::allbinary::media::graphics::geography::pathfinding::PathFinderGraphVisitorBase;
use org::allbinary::game::media::graphics::geography::map::racetrack::BasePathFinderGraphVisitor;

1;

