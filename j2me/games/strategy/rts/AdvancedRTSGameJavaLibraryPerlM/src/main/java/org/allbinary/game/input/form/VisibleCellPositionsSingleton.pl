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

package org::allbinary::game::input::form::VisibleCellPositionsSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::building::event::BuildingEventListenerInterface','org::allbinary::layer::event::ScrollMapEventListenerInterface';

our $instance = 'org::allbinary::game::input::form::VisibleCellPositionsSingleton'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{stationaryVisibleCellPositions} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_SHORT_ARRAY_ARRAY};
    $self->{visibleCellPositions} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_SHORT_ARRAY_ARRAY};
    $self->{currentlyVisibleCellPositions} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_SHORT_ARRAY_ARRAY};
    $self->{ALL_VISIBLE_TILEDLAYER} = 'javax::microedition::lcdui::game::SimpleTiledLayer'->new(0, 0, 0, 0);
    $self->{simpleTiledLayer} = $self->{ALL_VISIBLE_TILEDLAYER};
    $self->{paintSimpleTiledLayer} = $self->{ALL_VISIBLE_TILEDLAYER};
    $self->{currentIndex} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::form::VisibleCellPositionsSingleton::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        'org::allbinary::game::layer::building::event::LocalPlayerBuildingEventHandler'->getInstance()->addListenerInterface($self);
        'org::allbinary::layer::event::ScrollMapEventHandler'->getInstance()->addListenerInterface($self);
    return $self;
}


sub init {
    my ($self, $simpleTiledLayer) = @_;
        $self->{paintSimpleTiledLayer} = $self->{ALL_VISIBLE_TILEDLAYER};
        $self->{currentIndex} = 0;
        my $rows = $simpleTiledLayer->getRows();
        my $columns = $simpleTiledLayer->getColumns();
        $self->{stationaryVisibleCellPositions} = [map { [(0) x ($columns)] } 1 .. ($rows)];
        $self->{visibleCellPositions} = [map { [(0) x ($columns)] } 1 .. ($rows)];
        $self->{currentlyVisibleCellPositions} = [map { [(0) x ($columns)] } 1 .. ($rows)];
        $self->setSimpleTiledLayer($simpleTiledLayer);
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


# throws Exception
sub onBuildingEvent {
    my ($self, $event) = @_;
        $self->{paintSimpleTiledLayer} = $self->{simpleTiledLayer};
}


# throws Exception
sub onMoveEvent {
    my ($self, $scrollMapEvent) = @_;
        $self->move($scrollMapEvent->getDx(), $scrollMapEvent->getDy());
}


sub addStationaryCellPositions {
    my ($self, $list) = @_;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            my $cellPosition = $list->get($index);
            $self->{stationaryVisibleCellPositions}->[$cellPosition->getRow()]->[$cellPosition->getColumn()]++;
        }
}


sub removeStationaryCellPositions {
    my ($self, $list) = @_;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            my $cellPosition = $list->get($index);
            $self->{stationaryVisibleCellPositions}->[$cellPosition->getRow()]->[$cellPosition->getColumn()]--;
        }
}


sub update {
    my ($self) = @_;
        if ($self->{currentIndex} == 0) {
            my $temp = $self->{currentlyVisibleCellPositions};
            $self->{currentlyVisibleCellPositions} = $self->{visibleCellPositions};
            $self->{visibleCellPositions} = $temp;
            for (my $index = scalar(@{$self->{visibleCellPositions}}) - 1; $index >= 0; $index--) {
                for (my $index2 = scalar(@{$self->{visibleCellPositions}->[0]}) - 1; $index2 >= 0; $index2--) {
                    $self->{visibleCellPositions}->[$index]->[$index2] = $self->{stationaryVisibleCellPositions}->[$index]->[$index2];
                }
            }
        }
        $self->{currentIndex}++;
        if ($self->{currentIndex} > 10) {
            $self->{currentIndex} = 0;
        }
}


sub shouldProcess {
    my ($self) = @_;
        if ($self->{currentIndex} == 0) {
            return 1;
        } else {
            return 0;
        }
}


sub addCellPositions {
    my ($self, $list) = @_;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            my $cellPosition = $list->get($index);
            $self->{visibleCellPositions}->[$cellPosition->getRow()]->[$cellPosition->getColumn()]++;
        }
}


sub isVisible {
    my ($self, $cellPosition) = @_;
        if ($self->{visibleCellPositions}->[$cellPosition->getRow()]->[$cellPosition->getColumn()] > 0) {
            return 1;
        } else {
            return 0;
        }
}


sub move {
    my ($self, $dx, $dy) = @_;
        $self->getSimpleTiledLayer()->moveDXY($dx, $dy);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{paintSimpleTiledLayer}->paint($graphics, $self->{currentlyVisibleCellPositions});
}


sub setSimpleTiledLayer {
    my ($self, $simpleTiledLayer) = @_;
        $self->{simpleTiledLayer} = $simpleTiledLayer;
}


sub getSimpleTiledLayer {
    my ($self) = @_;
        return $self->{simpleTiledLayer};
}

# use javax::microedition::lcdui::game::SimpleTiledLayer;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::layer::RTSLayerEvent;
use org::allbinary::game::layer::building::event::BuildingEventListenerInterface;
use org::allbinary::game::layer::building::event::LocalPlayerBuildingEventHandler;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::graphics::CellPosition;
use org::allbinary::layer::event::ScrollMapEvent;
use org::allbinary::layer::event::ScrollMapEventHandler;
use org::allbinary::layer::event::ScrollMapEventListenerInterface;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;

1;

