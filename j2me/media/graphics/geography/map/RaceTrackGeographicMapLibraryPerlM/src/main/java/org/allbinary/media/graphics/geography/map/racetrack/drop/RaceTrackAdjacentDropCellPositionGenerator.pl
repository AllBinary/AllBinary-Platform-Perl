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

package org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackAdjacentDropCellPositionGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackDropCellPositionGenerator';

our $SINGLETON = 'org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackAdjacentDropCellPositionGenerator'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{layerCoveringCellPositionsUtil} = 'org::allbinary::game::layer::geographic::map::LayerCoveringCellPositionsUtil'->getInstance();
    $self->{groupCommonFactory} = 'org::allbinary::game::identification::GroupCommonFactory'->getInstance();
    $self->{surroundingCellPositions} = [(undef) x (4)];
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
    $self->{geographicMapDirectionUtil} = 'org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackAdjacentDropCellPositionGenerator::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getFirstNonRoadAdjacentCellPosition {
    my ($self, $column, $row) = @_;
        my $nonRoadGeographicMapCellPosition = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        my $geographicMapCellPositionFactory = $self->{raceTrackGeographicMap}->getGeographicMapCellPositionFactory();
        $self->{surroundingCellPositions}->[0] = $geographicMapCellPositionFactory->getAt($column, $row - 1);
        $self->{surroundingCellPositions}->[1] = $geographicMapCellPositionFactory->getAt($column, $row + 1);
        $self->{surroundingCellPositions}->[2] = $geographicMapCellPositionFactory->getAt($column - 1, $row);
        $self->{surroundingCellPositions}->[3] = $geographicMapCellPositionFactory->getAt($column + 1, $row);
        my $baseRaceTrackGeographicMap = $self->{raceTrackGeographicMap};
        my $raceTrackGeographicMapCellTypeFactory = $baseRaceTrackGeographicMap->getGeographicMapCellTypeFactory();
        my $geographicMapCellPosition = undef;
        my $raceTrackGeographicMapCellType = undef;
        for (my $index = scalar(@{$self->{surroundingCellPositions}}); --$index >= 0; ) {
            $geographicMapCellPosition = $self->{surroundingCellPositions}->[$index];
            $raceTrackGeographicMapCellType = $self->{raceTrackGeographicMap}->getCellTypeAt($geographicMapCellPosition);
            if (!$raceTrackGeographicMapCellTypeFactory->isPath($raceTrackGeographicMapCellType)) {
                $nonRoadGeographicMapCellPosition = $geographicMapCellPosition;
                last;
            }
        }
        return $nonRoadGeographicMapCellPosition;
}


# throws Exception
sub update {
    my ($self, $allBinaryGameLayerManager, $geographicMapInterface) = @_;
        $self->{hashtable}->put($org::allbinary::game::layer::AllBinaryGameLayerManager::ID, $allBinaryGameLayerManager);
        $self->SUPER::update($allBinaryGameLayerManager, $geographicMapInterface);
}


# throws Exception
sub drop {
    my ($self, $allBinaryLayerManager, $index) = @_;
        my $geographicMapCellPosition = $self->{list}->get($index);
        my $randomGeographicMapCellPosition = $self->getFirstNonRoadAdjacentCellPosition($geographicMapCellPosition->getColumn(), $geographicMapCellPosition->getRow());
        if (!defined($randomGeographicMapCellPosition)) {
            return;
        }
        my $dropCellPositionHistory = 'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance();
        if (!$dropCellPositionHistory->isCellPositionWithDrop($geographicMapCellPosition)) {
            my $direction = $self->{geographicMapDirectionUtil}->getDirectionFromCellPositionToAdjacentCellPosition($randomGeographicMapCellPosition, $geographicMapCellPosition);
            my $objectCanBeNull = $self->{hashtable}->get($self->{groupCommonFactory}->{ID});
            if (defined($objectCanBeNull)) {
            } else {
                $self->{hashtable}->put($self->{groupCommonFactory}->{ID}, 'org::allbinary::game::identification::BasicGroupFactory'->getInstance()->{NONE_ARRAY});
            }
            $self->{hashtable}->put('org::allbinary::direction::DirectionFactory'->getInstance()->{NAME}, $direction);
            my $point = $randomGeographicMapCellPosition->getPoint();
            my $x = $point->getX();
            my $y = $point->getY();
            my $z = $point->getZ();
            my $layerInterface = 'org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackAdjacentDropLayerFactory'->getInstance()->getRandomInstance()->getNextInstance($self->{hashtable}, $x, $y, $z);
            my $baseRaceTrackGeographicMap = $self->{raceTrackGeographicMap};
            my $list = $self->{layerCoveringCellPositionsUtil}->getAll($baseRaceTrackGeographicMap, $randomGeographicMapCellPosition, $layerInterface, 'org::allbinary::util::BasicArrayListD'->new());
            if ($dropCellPositionHistory->anyCellPositionWithDrop($list)) {
                return;
            }
            my $geographicMapCellType = undef;
            for (my $index2 = $list->size(); --$index2 >= 0; ) {
                $geographicMapCellType = $self->{raceTrackGeographicMap}->getCellTypeAt($list->get($index2));
                if ($self->{raceTrackGeographicMapCellTypeFactory}->isPath($geographicMapCellType)) {
                    return;
                }
            }
            $dropCellPositionHistory->addAll($list, $layerInterface);
            $allBinaryLayerManager->append($layerInterface);
        }
}

use org::allbinary::game::identification::GroupCommonFactory;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::game::identification::BasicGroupFactory;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::geographic::map::LayerCoveringCellPositionsUtil;
use org::allbinary::graphics::GPoint;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::StdUtil;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionGeneratorInterface;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use org::allbinary::media::graphics::geography::map::racetrack::BaseRaceTrackGeographicMap;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory;
use org::allbinary::util::ABHashtable;
use org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackDropCellPositionGenerator;
use org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackAdjacentDropLayerFactory;

1;

