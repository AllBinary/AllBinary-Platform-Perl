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

package org::allbinary::media::graphics::geography::pathfinding::GeographicPathFinderBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_GEOGRAPHIC_PATH_FINDER_BASE = 'org::allbinary::media::graphics::geography::pathfinding::GeographicPathFinderBase'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub searchTotalPath {
    my ($self, $startPathFindingNodeList, $endPathFindingNodeList, $totalPaths) = @_;
        die ("RuntimeException");
}


# throws Exception
sub searchTotalPathN {
    my ($self, $startPathFindingNodeList, $endPathFindingNodeList, $totalPaths, $multipassState) = @_;
        die ("RuntimeException");
}

use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;

1;

