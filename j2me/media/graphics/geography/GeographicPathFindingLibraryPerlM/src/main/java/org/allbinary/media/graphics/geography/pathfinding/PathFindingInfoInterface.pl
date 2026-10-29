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

# Java interface
package org::allbinary::media::graphics::geography::pathfinding::PathFindingInfoInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getStartPathFindingNodeList {
    my ($self) = @_;
    die "abstract method getStartPathFindingNodeList";
}


sub getEndPathFindingNodeList {
    my ($self) = @_;
    die "abstract method getEndPathFindingNodeList";
}


sub getPathFinder {
    my ($self) = @_;
    die "abstract method getPathFinder";
}

use org::allbinary::util::BasicArrayList;

1;

