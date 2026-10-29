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

package org::allbinary::game::ai::path::BasicAIProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{geographicMapCellHistory} = undef;
    $self->{geographicMapCellPositionBasicArrayList} = undef;
    $self->{geographicMapCellPathHistoryInfo} = undef;
    $self->{basicAI} = undef;
    $self->{geographicMapDirectionUtil} = 'org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil'->getInstance();
}


sub new {
    my ($class, $name, $geographicMapCellHistory, $geographicMapCellPathHistoryInfo, $chosenPathList, $angleInfo, $seed) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{geographicMapCellHistory} = $geographicMapCellHistory;
        $self->{geographicMapCellPositionBasicArrayList} = $chosenPathList;
        $self->{geographicMapCellPathHistoryInfo} = $geographicMapCellPathHistoryInfo;
        $self->setName($name);
        $self->setNewPath($geographicMapCellHistory, $chosenPathList);
        $self->{basicAI} = 'org::allbinary::game::ai::path::BasicDirectionAIHelper'->new($self->getName(), $angleInfo);
    return $self;
}


sub setNewPath {
    my ($self, $geographicMapCellHistory, $chosenPathList) = @_;
        $self->setGeographicMapCellHistory($geographicMapCellHistory);
        $self->{geographicMapCellPositionBasicArrayList} = $chosenPathList;
        $self->init();
}


sub init {
    my ($self) = @_;
        $self->{geographicMapCellPathHistoryInfo} = 'org::allbinary::media::graphics::geography::pathfinding::GeographicMapCellPathHistoryInfo'->new();
        $self->{geographicMapCellPathHistoryInfo}->setPreviousOnPathGeographicMapCellPosition($self->{geographicMapCellPositionBasicArrayList}->get($self->{geographicMapCellPositionBasicArrayList}->size() - 1));
        $self->{geographicMapCellPathHistoryInfo}->setNextOnPathGeographicMapCellPosition($self->{geographicMapCellPositionBasicArrayList}->get($self->{geographicMapCellPositionBasicArrayList}->size() - 1));
        $self->update();
}


# throws Exception
sub goTowardNextChosenOnPathPosition {
    my ($self, $currentGeographicMapCellPosition) = @_;
        my $keyDirection = -1;
        my $goToGeographicMapCellPosition = $self->{geographicMapCellPathHistoryInfo}->getNextChosenOnPathGeographicMapCellPosition();
        my $geographicMapDirectionData = $self->{geographicMapDirectionUtil}->getDirectionFromCellPositionToAdjacentCellPosition($currentGeographicMapCellPosition, $goToGeographicMapCellPosition);
        if ($geographicMapDirectionData == 'org::allbinary::direction::DirectionFactory'->getInstance()->{NOT_BORDERED_WITH}) {
            $geographicMapDirectionData = $self->{geographicMapDirectionUtil}->getDirectionFromCellPositionToCellPosition($currentGeographicMapCellPosition, $goToGeographicMapCellPosition);
        }
        $keyDirection = $self->{basicAI}->getAIKeyPressedFromDirection($geographicMapDirectionData);
        return $keyDirection;
}


sub update {
    my ($self) = @_;
        $self->{geographicMapCellPathHistoryInfo}->setNextUnvisitedOnPathGeographicMapCellPosition($self->getGeographicMapCellHistory()->getFirstUnvisited());
        $self->{geographicMapCellPathHistoryInfo}->setNextChosenOnPathGeographicMapCellPosition($self->{geographicMapCellPathHistoryInfo}->getNextUnvisitedOnPathGeographicMapCellPosition());
}


# throws Exception
sub processAI {
    my ($self, $myManager, $currentGeographicMapCellPosition) = @_;
        my $keyDirection = -1;
        if ($self->{geographicMapCellPositionBasicArrayList}->contains($currentGeographicMapCellPosition)) {
            $self->update();
            $keyDirection = $self->goTowardNextChosenOnPathPosition($currentGeographicMapCellPosition);
            $self->{geographicMapCellPathHistoryInfo}->setPreviousOnPathGeographicMapCellPosition($currentGeographicMapCellPosition);
        } else {
            $keyDirection = $self->goTowardNextChosenOnPathPosition($currentGeographicMapCellPosition);
        }
        return $keyDirection;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub getGeographicMapCellPathHistoryInfo {
    my ($self) = @_;
        return $self->{geographicMapCellPathHistoryInfo};
}


sub setGeographicMapCellPathHistoryInfo {
    my ($self, $geographicMapCellPathHistoryInfo) = @_;
        $self->{geographicMapCellPathHistoryInfo} = $geographicMapCellPathHistoryInfo;
}


sub getGeographicMapCellHistory {
    my ($self) = @_;
        return $self->{geographicMapCellHistory};
}


sub setGeographicMapCellHistory {
    my ($self, $geographicMapCellHistory) = @_;
        $self->{geographicMapCellHistory} = $geographicMapCellHistory;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil;
use org::allbinary::media::graphics::geography::pathfinding::GeographicMapCellPathHistoryInfo;
use org::allbinary::game::ai::path::BasicDirectionAIHelper;

1;

