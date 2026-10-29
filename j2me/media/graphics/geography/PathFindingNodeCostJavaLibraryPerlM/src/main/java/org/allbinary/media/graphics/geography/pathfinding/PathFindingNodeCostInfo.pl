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

package org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{pathFindingNodeCostInfoData} = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoData'->getInstance();
    $self->{costFromStartP} = undef;
    $self->{costToEndP} = undef;
    $self->{totalCostP} = 0;
}


sub new {
    my ($class, $costFromStart, $costToGoal) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{costFromStartP} = $costFromStart;
        $self->{costToEndP} = $costToGoal;
        $self->setCalculatedTotalCost();
    return $self;
}


sub setCostToEnd {
    my ($self, $costToEnd) = @_;
        $self->{costToEndP} = $costToEnd;
}


sub setTotalCost {
    my ($self, $totalCost) = @_;
        $self->{totalCostP} = $totalCost;
}


# throws Exception
sub setCalculatedTotalCost {
    my ($self) = @_;
        $self->{totalCostP} = $self->{costFromStartP} + $self->{costToEndP};
        if ($self->{totalCostP} > $self->{pathFindingNodeCostInfoData}->{MAX_NODE_COST}) {
            die ("Max Cost Exceeded");
        }
}


sub setCostFromStart {
    my ($self, $cost) = @_;
        $self->{costFromStartP} = $cost;
}


sub addCostFromStart {
    my ($self, $cost) = @_;
        $self->{costFromStartP} += $cost;
}


sub compareTo {
    my ($self, $pathFindingNodeCostInfo) = @_;
        return $org::allbinary::media::graphics::geography::pathfinding::java::lang->{Long}->compare($self->{totalCostP}, $pathFindingNodeCostInfo->{totalCostP});
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append(ref($self));
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{COLON_SEP});
        $stringBuffer->append("CostFromStart: ");
        $stringBuffer->appendlong($self->{costFromStartP});
        $stringBuffer->append(" CostToEnd: ");
        $stringBuffer->appendlong($self->{costToEndP});
        $stringBuffer->append(" TotalCost: ");
        $stringBuffer->appendlong($self->{totalCostP});
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoData;

1;

