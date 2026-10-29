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

package org::allbinary::media::graphics::geography::map::racetrack::BasePathFindingInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub init {
    my ($self, $geographicMapInterface, $pathFindingInfo, $mapArray) = @_;
        {
        package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellPositionFactoryInitVisitor;
        use strict;
        use warnings;
        use feature 'try';
        no warnings 'experimental::try';
        use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInitVisitorInterface';
        

        sub _init_fields {
            my ($self) = @_;
            $self->{startLineId} = undef;
            $self->{finishLineId} = undef;
        }
        

        sub new {
            my ($class) = @_;
            my $self = bless({}, $class);
            $self->_init_fields();
                my $raceTrackGeographicMapCellTypeFactory = $self->{geographicMapInterface}->getGeographicMapCellTypeFactory();
                $self->{startLineId} = $raceTrackGeographicMapCellTypeFactory->getStartType();
                $self->{finishLineId} = $raceTrackGeographicMapCellTypeFactory->getEndType();
            return $self;
        }
        

        # throws Exception
        sub visit {
            my ($self, $tiledLayer, $cellPosition) = @_;
                my $row = $cellPosition->getRow();
                my $column = $cellPosition->getColumn();
                try {
                    my $cellTypeId = $self->{mapArray}->[$row]->[$column];
                    my $geographicCellType = $self->{geographicMapInterface}->getCellTypeFromMapCellTypeInt($cellTypeId);
                    if ($geographicCellType == $self->{startLineId}) {
                        $self->addStartPathFindingNode($self->{pathFindingInfo}, $cellPosition);
                    }
                    if ($geographicCellType == $self->{finishLineId}) {
                        if ($geographicCellType == $self->{startLineId}) {
                            $self->addEndPathFindingNode($self->{pathFindingInfo}, $self->{geographicMapInterface}->getGeographicMapCellPositionFactoryInterface()->getInstance($self->{geographicMapInterface}, $cellPosition->getColumn(), $cellPosition->getRow(), $tiledLayer->getColumns(), $tiledLayer->getRows(), $tiledLayer->getCellWidth(), $tiledLayer->getCellHeight()));
                        } else {
                            $self->addEndPathFindingNode($self->{pathFindingInfo}, $cellPosition);
                        }
                    }
                    my $raceTrackGeographicMapCellTypeFactory = $self->{geographicMapInterface}->getGeographicMapCellTypeFactory();
                    my $geographicMapCellTypeFactory = 'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory'->getInstance();
                    if ($raceTrackGeographicMapCellTypeFactory->isPath($geographicMapCellTypeFactory->get($geographicCellType))) {
                        'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory'->getInstance()->track($cellPosition);
                    } else {
                    }
                } catch ($e) {
                    my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
                    $self->{logUtil}->put('org::allbinary::logic::string::StringMaker'->new()->append($commonSeps->{BRACKET_OPEN})->appendint($row)->append($commonSeps->{BRACKET_CLOSE})->append($commonSeps->{BRACKET_OPEN})->appendint($column)->append("] in [")->appendint(scalar(@{$self->{mapArray}}))->append($commonSeps->{BRACKET_CLOSE})->append($commonSeps->{BRACKET_OPEN})->appendint(scalar(@{$self->{mapArray}->[0]}))->append($commonSeps->{BRACKET_CLOSE})->toString(), $self, "visit", $e);
                    die $e;
                }
        }
        }

        $geographicMapInterface->getGeographicMapCellPositionFactory()->visit('org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellPositionFactoryInitVisitor'->new());
}


# throws Exception
sub addStartPathFindingNode {
    my ($self, $pathFindingInfo, $startGeographicMapCellPosition) = @_;
        $pathFindingInfo->addStartPathFindingNode('org::allbinary::media::graphics::geography::pathfinding::PathFindingNode'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}, $startGeographicMapCellPosition));
}


# throws Exception
sub addEndPathFindingNode {
    my ($self, $pathFindingInfo, $endGeographicMapCellPosition) = @_;
        $pathFindingInfo->addEndPathFindingNode('org::allbinary::media::graphics::geography::pathfinding::PathFindingNode'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}, $endGeographicMapCellPosition));
}


# throws Exception
sub getInstancePathFindingInfo {
    my ($self, $geographicMapInterface, $graphArray) = @_;
        die ("RuntimeException");
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNode;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInitVisitorInterface;
use org::allbinary::string::CommonSeps;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory;

1;

