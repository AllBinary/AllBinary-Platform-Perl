#
# AllBinary Open License Version 1
# Copyright (c) 2006 AllBinary
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

package org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCost;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::PathFindingNode';

our $NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY = [map { [(undef) x (0)] } 1 .. (0)];

sub _init_fields {
    my ($self) = @_;
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{pathFindingNodeCostInfoP} = undef;
}


sub new {
    my ($class, $parent, $geographicMapCellPosition, $pathFindingNodeCostInfo) = @_;
    my $self = $class->SUPER::new($parent, $geographicMapCellPosition);
    $self->_init_fields();
        # super(...) made $self above
        $self->{pathFindingNodeCostInfoP} = $pathFindingNodeCostInfo;
        if (!defined($self->{geographicMapCellPosition})) {
            die ("No GeographicMapCellPosition");
        }
        if (!defined($self->getPathFindingNodeCostInfo())) {
            die ("No PathFindingNodeCostInfo");
        }
    return $self;
}


sub getPathFindingNodeCostInfo {
    my ($self) = @_;
        return $self->{pathFindingNodeCostInfoP};
}


sub setPathFindingNodeCostInfo {
    my ($self, $pathFindingNodeCostInfo) = @_;
        $self->{pathFindingNodeCostInfoP} = $pathFindingNodeCostInfo;
}


sub compareTo {
    my ($self, $pathFindingNodeCost) = @_;
        return $self->{pathFindingNodeCostInfoP}->compareTo($pathFindingNodeCost->{pathFindingNodeCostInfoP});
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append(ref($self));
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{COLON_SEP});
        $stringBuffer->append($self->getPathFindingNodeCostInfo()->toString());
        $stringBuffer->append(" Path: ");
        $stringBuffer->append($self->{geographicMapCellPosition}->toString());
        my $pathFindingNode = $self->{parent};
        while (defined($pathFindingNode)) {
            $stringBuffer->append($pathFindingNode->{geographicMapCellPosition}->toString());
            $stringBuffer->append($self->{commonSeps}->{SPACE});
            $pathFindingNode = $pathFindingNode->{parent};
        }
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::string::CommonLabels;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNode;

1;

