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

package org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::PathFindingInfoInterface';

our $NULL_PATH_FINDING_INFO = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo'->new($org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase::NULL_PATH_FINDING_NODE_COST_INFO_FACTORY_BASE, 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance(), 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance());

sub _init_fields {
    my ($self) = @_;
    $self->{pathFinder} = $org::allbinary::media::graphics::geography::pathfinding::GeographicPathFinderBase::NULL_GEOGRAPHIC_PATH_FINDER_BASE;
    $self->{startPathFindingNodeList} = undef;
    $self->{endPathFindingNodeList} = undef;
    $self->{pathFindingNodeCostInfoFactoryInterface} = undef;
}


sub new {
    my ($class, $pathFindingNodeCostInfoFactoryInterface, $startPathFindingNodeList, $endPathFindingNodeList) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{pathFindingNodeCostInfoFactoryInterface} = $pathFindingNodeCostInfoFactoryInterface;
        $self->{startPathFindingNodeList} = $startPathFindingNodeList;
        $self->{endPathFindingNodeList} = $endPathFindingNodeList;
    return $self;
}


sub getStartPathFindingNodeList {
    my ($self) = @_;
        return $self->{startPathFindingNodeList};
}


sub getEndPathFindingNodeList {
    my ($self) = @_;
        return $self->{endPathFindingNodeList};
}


sub getPathFinder {
    my ($self) = @_;
        return $self->{pathFinder};
}


sub addStartPathFindingNode {
    my ($self, $startPathFindingNode) = @_;
        $self->{startPathFindingNodeList}->add($startPathFindingNode);
}


sub addEndPathFindingNode {
    my ($self, $endPathFindingNode) = @_;
        $self->{endPathFindingNodeList}->add($endPathFindingNode);
}


sub setPathFinder {
    my ($self, $pathFinder) = @_;
        $self->{pathFinder} = $pathFinder;
}


sub getPathFindingNodeCostInfoFactoryInterface {
    my ($self) = @_;
        return $self->{pathFindingNodeCostInfoFactoryInterface};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfoInterface;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase;
use org::allbinary::media::graphics::geography::pathfinding::GeographicPathFinderBase;

1;

