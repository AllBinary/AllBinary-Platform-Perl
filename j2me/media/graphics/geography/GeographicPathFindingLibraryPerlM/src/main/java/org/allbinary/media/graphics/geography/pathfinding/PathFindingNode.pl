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

package org::allbinary::media::graphics::geography::pathfinding::PathFindingNode;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{parent} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
    $self->{geographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
}


sub new {
    my ($class, $parent, $geographicMapCellPosition) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{parent} = $parent;
        $self->setGeographicMapCellPositionP($geographicMapCellPosition);
        if ($self->{geographicMapCellPosition} == $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            die ("No GeographicMapCellPosition");
        }
    return $self;
}


sub getParentP {
    my ($self) = @_;
        return $self->{parent};
}


sub setGeographicMapCellPositionP {
    my ($self, $geographicMapCellPosition) = @_;
        $self->{geographicMapCellPosition} = $geographicMapCellPosition;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append(ref($self));
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{COLON_SEP});
        $stringBuffer->append(" Path: ");
        $stringBuffer->append($self->{geographicMapCellPosition}->toString());
        my $pathFindingNode = $self->getParentP();
        while (defined($pathFindingNode)) {
            $stringBuffer->append($pathFindingNode->{geographicMapCellPosition}->toString());
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
            $pathFindingNode = $pathFindingNode->getParentP();
        }
        return $stringBuffer->toString();
}

use org::allbinary::logic::NullUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::string::CommonLabels;

1;

