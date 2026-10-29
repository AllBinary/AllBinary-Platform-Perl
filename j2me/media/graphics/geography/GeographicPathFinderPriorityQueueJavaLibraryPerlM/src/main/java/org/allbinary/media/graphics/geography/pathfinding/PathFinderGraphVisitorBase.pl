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
package org::allbinary::media::graphics::geography::pathfinding::PathFinderGraphVisitorBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub visit {
    my ($self, $graph, $startPathFindingNodeList, $endPathFindingNodeList) = @_;
        die ("RuntimeException");
}


# throws Exception
sub fixPath {
    my ($self, $startPathFindingNodeList, $endPathFindingNodeList, $pathList) = @_;
        die ("RuntimeException");
}


sub isValid {
    my ($self, $graphPath) = @_;
        die ("RuntimeException");
}


sub getInvalidReason {
    my ($self, $graphPath) = @_;
        die ("RuntimeException");
}

use org::allbinary::util::BasicArrayList;

1;

