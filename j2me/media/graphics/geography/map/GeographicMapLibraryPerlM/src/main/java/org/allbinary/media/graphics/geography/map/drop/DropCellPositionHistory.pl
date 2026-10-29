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

package org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{cellPositionFactory} = 'org::allbinary::graphics::CellPositionFactory'->getInstance();
    $self->{positionList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{layerList} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory::SINGLETON;
}


sub add {
    my ($self, $cellPosition, $layerInterface) = @_;
        $self->{positionList}->add($cellPosition);
        $self->{layerList}->add($layerInterface);
}


sub addAll {
    my ($self, $list, $layerInterface) = @_;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            $self->add($list->get($index), $layerInterface);
        }
}


sub remove {
    my ($self, $cellPosition) = @_;
        my $index = $self->{positionList}->indexOf($cellPosition);
        if ($index >= 0) {
            $self->{positionList}->removeAt($index);
            $self->{layerList}->removeAt($index);
        }
}


sub removeAll {
    my ($self, $layerInterface) = @_;
        my $index = 0;
        while ($index != -1) {
            $index = $self->{layerList}->indexOf($layerInterface);
            if ($index >= 0) {
                $self->{positionList}->removeAt($index);
                $self->{layerList}->removeAt($index);
            }
        }
}


sub clear {
    my ($self) = @_;
        $self->{positionList}->clear();
        $self->{layerList}->clear();
}


sub isCellPositionWithDrop {
    my ($self, $cellPosition) = @_;
        return $self->{positionList}->contains($cellPosition);
}


sub anyCellPositionWithDrop {
    my ($self, $list) = @_;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            if ($self->isCellPositionWithDrop($list->get($index))) {
                return 1;
            }
        }
        return 0;
}


sub getCellPositionWithDrop {
    my ($self, $list) = @_;
        my $cellPosition = undef;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            $cellPosition = $list->get($index);
            if ($self->isCellPositionWithDrop($cellPosition)) {
                return $cellPosition;
            }
        }
        return $self->{cellPositionFactory}->{NONE};
}


sub getLayerInterface {
    my ($self, $cellPosition) = @_;
        my $index = $self->{positionList}->indexOf($cellPosition);
        if ($index >= 0) {
            return $self->{layerList}->get($index);
        } else {
            return $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::CellPosition;
use org::allbinary::graphics::CellPositionFactory;
use org::allbinary::layer::AllBinaryLayer;

1;

