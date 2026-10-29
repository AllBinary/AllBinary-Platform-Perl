# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::behavior::topview::GeographicMapTopViewGameLayerBehavior2;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::behavior::topview::GeographicMapTopViewLayerBehavior';


sub _init_fields {
    my ($self) = @_;
    $self->{gravityUtil} = 'org::allbinary::game::physics::acceleration::GravityUtil'->getInstance();
    $self->{geographicMapBehavior} = 'org::allbinary::media::graphics::geography::map::MultiGeographicMapBehavior'->new();
    $self->{autoStepBlocks} = undef;
    $self->{offsetY} = undef;
    $self->{previousGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
}


sub new {
    my ($class, $maxGravityActionIndex, $autoStepBlocks, $offsetY) = @_;
    my $self = $class->SUPER::new($maxGravityActionIndex);
    $self->_init_fields();
        # super(...) made $self above
        $self->{autoStepBlocks} = $autoStepBlocks;
        $self->{offsetY} = $offsetY;
    return $self;
}


# throws Exception
sub gravity {
    my ($self, $velocityProperties, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition) = @_;
        if ($geographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            $self->{geographicMapBehavior}->getCellTypeAt($geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition);
            my $hasSolidBlock = $self->hasSolidBlock($geographicMapInterfaceArray, $geographicMapCellTypeArray);
            if (!$hasSolidBlock) {
                $self->{gravityUtil}->process($velocityProperties, $self->{gravityUtil}->{GAME_GRAVITY_VELOCITY});
                $velocityProperties->limitXYToForwardAndReverseMaxVelocity();
                $self->gravity();
            } else {
            }
        }
}


# throws Exception
sub getPositionTopLeft {
    my ($self, $geographicMapInterfaceArray, $layer, $x, $y) = @_;
        my $xCellPosition = $layer->getXP() + -$x;
        my $yCellPosition = $layer->getYP() + -$y;
        return $geographicMapInterfaceArray->[0]->getCellPositionAtXYNoThrow($xCellPosition, $yCellPosition);
}


# throws Exception
sub getPositionTopRight {
    my ($self, $geographicMapInterfaceArray, $layer, $x, $y) = @_;
        my $xCellPosition = $layer->getXP() + -$x + $layer->getWidth();
        my $yCellPosition = $layer->getYP() + -$y;
        return $geographicMapInterfaceArray->[0]->getCellPositionAtXYNoThrow($xCellPosition, $yCellPosition);
}


# throws Exception
sub getPositionBottomLeft {
    my ($self, $geographicMapInterfaceArray, $layer, $x, $y) = @_;
        my $xCellPosition = $layer->getXP() + -$x;
        my $yCellPosition = $layer->getYP() + -$y + $layer->getHeight();
        return $geographicMapInterfaceArray->[0]->getCellPositionAtXYNoThrow($xCellPosition, $yCellPosition);
}


# throws Exception
sub getPositionBottomRight {
    my ($self, $geographicMapInterfaceArray, $layer, $x, $y) = @_;
        my $xCellPosition = $layer->getXP() + -$x + $layer->getWidth();
        my $yCellPosition = $layer->getYP() + -$y + $layer->getHeight();
        return $geographicMapInterfaceArray->[0]->getCellPositionAtXYNoThrow($xCellPosition, $yCellPosition);
}


# throws Exception
sub getLeftPosition {
    my ($self, $geographicMapInterfaceArray, $layer) = @_;
        my $xCellPosition = $layer->getXP();
        my $yCellPosition = $layer->getYP() + $layer->getHeight();
        return $geographicMapInterfaceArray->[0]->getCellPositionAtXYNoThrow($xCellPosition, $yCellPosition);
}


# throws Exception
sub getRightPosition {
    my ($self, $geographicMapInterfaceArray, $layer) = @_;
        my $xCellPosition = $layer->getXP() + $layer->getWidth();
        my $yCellPosition = $layer->getYP() + $layer->getHeight();
        return $geographicMapInterfaceArray->[0]->getCellPositionAtXYNoThrow($xCellPosition, $yCellPosition);
}


# throws Exception
sub getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $velocityProperties, $layer, $x, $y) = @_;
        my $geographicMapCellPosition = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        my $topLeftGeographicMapCellPosition = $self->getPositionTopLeft($geographicMapInterfaceArray, $layer, $x, $y);
        $geographicMapCellPosition = $self->getGeographicMapCellPositionIfNotSolidBlockOrOffMap($geographicMapInterfaceArray, $geographicMapCellTypeArray, $topLeftGeographicMapCellPosition, $velocityProperties, $layer);
        if ($geographicMapCellPosition == $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        }
        my $topRightGeographicMapCellPosition = $self->getPositionTopRight($geographicMapInterfaceArray, $layer, $x, $y);
        $geographicMapCellPosition = $self->getGeographicMapCellPositionIfNotSolidBlockOrOffMap($geographicMapInterfaceArray, $geographicMapCellTypeArray, $topRightGeographicMapCellPosition, $velocityProperties, $layer);
        if ($geographicMapCellPosition == $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        }
        my $bottomLeftGeographicMapCellPosition = $self->getPositionBottomLeft($geographicMapInterfaceArray, $layer, $x, $y);
        $geographicMapCellPosition = $self->getGeographicMapCellPositionIfNotSolidBlockOrOffMap($geographicMapInterfaceArray, $geographicMapCellTypeArray, $bottomLeftGeographicMapCellPosition, $velocityProperties, $layer);
        if ($geographicMapCellPosition == $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        }
        my $bottomRightGeographicMapCellPosition = $self->getPositionBottomRight($geographicMapInterfaceArray, $layer, $x, $y);
        $geographicMapCellPosition = $self->getGeographicMapCellPositionIfNotSolidBlockOrOffMap($geographicMapInterfaceArray, $geographicMapCellTypeArray, $bottomRightGeographicMapCellPosition, $velocityProperties, $layer);
        if ($geographicMapCellPosition == $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
        } else {
        }
        return $geographicMapCellPosition;
}


# throws Exception
sub getGeographicMapCellPositionIfNotSolidBlockOrOffMap {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition, $velocityProperties, $layer) = @_;
        if ($geographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            my $possibleStepGeographicMapCellPosition = $geographicMapCellPosition;
            my $tiledLayer = $geographicMapInterfaceArray->[0]->getAllBinaryTiledLayer();
            if ($possibleStepGeographicMapCellPosition->getColumn() > 0 && $possibleStepGeographicMapCellPosition->getRow() > 0 && $possibleStepGeographicMapCellPosition->getColumn() < $tiledLayer->getColumns() && $possibleStepGeographicMapCellPosition->getRow() < $tiledLayer->getRows()) {
                $self->{geographicMapBehavior}->getCellTypeAt($geographicMapInterfaceArray, $geographicMapCellTypeArray, $possibleStepGeographicMapCellPosition);
                my $hasSolidBlock = $self->hasSolidBlock($geographicMapInterfaceArray, $geographicMapCellTypeArray);
                my $hasOffMap = $self->isOffMap($geographicMapInterfaceArray, $geographicMapCellTypeArray);
                if ($hasSolidBlock || $hasOffMap) {
                    $self->{previousGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                    return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                } else {
                    $self->{previousGeographicMapCellPosition} = $possibleStepGeographicMapCellPosition;
                    return $possibleStepGeographicMapCellPosition;
                }
            }
        } else {
        }
        $self->{previousGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
}


# throws Exception
sub moveAndLand {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition, $velocityProperties, $layer, $x, $y) = @_;
        if ($geographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            my $topViewCharacterInterface = ($layer);
            $topViewCharacterInterface->terrainMove($geographicMapInterfaceArray, $geographicMapCellTypeArray, $x, $y);
        } else {
        }
}


# throws Exception
sub move {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $velocityProperties, $layer, $x, $y) = @_;
        my $geographicMapCellPosition = $self->getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation($geographicMapInterfaceArray, $geographicMapCellTypeArray, $velocityProperties, $layer, $x, $y);
        $self->moveAndLand($geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition, $velocityProperties, $layer, $x, $y);
        if ($geographicMapCellPosition == $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            return 0;
        } else {
            return 1;
        }
}


# throws Exception
sub left {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $velocityProperties, $layer) = @_;
        my $geographicMapCellPosition = $self->getLeftPosition($geographicMapInterfaceArray, $layer);
        if ($geographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            my $possibleStepGeographicMapCellPosition = $geographicMapInterfaceArray->[0]->getGeographicMapCellPositionFactory()->getAt($geographicMapCellPosition->getColumn(), $geographicMapCellPosition->getRow() - 1);
            $self->{geographicMapBehavior}->getCellTypeAt($geographicMapInterfaceArray, $geographicMapCellTypeArray, $possibleStepGeographicMapCellPosition);
            my $hasSolidBlock = $self->hasSolidBlock($geographicMapInterfaceArray, $geographicMapCellTypeArray);
            if ($hasSolidBlock) {
                if ($self->{autoStepBlocks}) {
                    my $topViewCharacterInterface = ($layer);
                    $topViewCharacterInterface->leftp();
                } else {
                    $velocityProperties->getVelocityXBasicDecimalP()->setint(0);
                }
            } else {
                my $topViewCharacterInterface = ($layer);
                $topViewCharacterInterface->leftp();
            }
        }
}


# throws Exception
sub right {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $velocityProperties, $layer) = @_;
        my $geographicMapCellPosition = $self->getRightPosition($geographicMapInterfaceArray, $layer);
        if ($geographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            my $possibleStepGeographicMapCellPosition = $geographicMapInterfaceArray->[0]->getGeographicMapCellPositionFactory()->getAt($geographicMapCellPosition->getColumn(), $geographicMapCellPosition->getRow() - 1);
            $self->{geographicMapBehavior}->getCellTypeAt($geographicMapInterfaceArray, $geographicMapCellTypeArray, $possibleStepGeographicMapCellPosition);
            my $hasSolidBlock = $self->hasSolidBlock($geographicMapInterfaceArray, $geographicMapCellTypeArray);
            if ($hasSolidBlock) {
                if ($self->{autoStepBlocks}) {
                    my $topViewCharacterInterface = ($layer);
                    $topViewCharacterInterface->rightp();
                } else {
                    $velocityProperties->getVelocityXBasicDecimalP()->setint(0);
                }
            } else {
                my $topViewCharacterInterface = ($layer);
                $topViewCharacterInterface->rightp();
            }
        }
}

use org::allbinary::media::graphics::geography::map::MultiGeographicMapBehavior;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::physics::acceleration::GravityUtil;
use org::allbinary::game::physics::velocity::VelocityProperties;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::game::behavior::topview::GeographicMapTopViewLayerBehavior;

1;

