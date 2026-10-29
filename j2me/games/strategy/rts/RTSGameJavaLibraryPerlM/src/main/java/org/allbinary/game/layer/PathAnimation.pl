# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::PathAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::Animation';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{linePathAnimation} = undef;
    $self->{pathFindingLayer} = undef;
    $self->{allBinaryGameLayerManagerP} = 'org::allbinary::game::layer::AllBinaryGameLayerManager'->getNullInstance();
    $self->{startColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED};
    $self->{middleColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLUE};
    $self->{endColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{GREEN};
}


sub new {
    my ($class, $pathFindingLayer, $linePathAnimation) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{pathFindingLayer} = $pathFindingLayer;
        $self->{linePathAnimation} = $linePathAnimation;
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->{allBinaryGameLayerManagerP} = $allBinaryGameLayerManager;
}


# throws Exception
sub nextFrame {
    my ($self) = @_;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        try {
            my $waypointBehaviorBase = $self->{pathFindingLayer}->getWaypointBehavior();
            if (defined($waypointBehaviorBase)) {
                my $geographicMapCellHistory = $waypointBehaviorBase->getCurrentGeographicMapCellHistory();
                my $list = $geographicMapCellHistory->getTracked();
                my $size = $list->size();
                if ($size > 0) {
                    my $geographicMapCompositeInterface = $self->{allBinaryGameLayerManagerP};
                    my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
                    my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
                    my $geographicMapCellPosition = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                    my $nextPoint = undef;
                    my $point = undef;
                    my $start = $size - 2;
                    for (my $index = 0; $index < $size - 1; $index++) {
                        if ($index == $start) {
                            $self->setBasicColorP($self->{startColor});
                            $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->getBasicColorP(), $self->getColor());
                        } elsif ($geographicMapCellHistory->isVisited($geographicMapCellPosition)) {
                            $self->setBasicColorP($self->{endColor});
                            $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->getBasicColorP(), $self->getColor());
                        } else {
                            $self->setBasicColorP($self->{middleColor});
                            $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->getBasicColorP(), $self->getColor());
                        }
                        $geographicMapCellPosition = $list->get($index);
                        $point = $geographicMapCellPosition->getMidPoint();
                        $geographicMapCellPosition = $list->get($index + 1);
                        $nextPoint = $geographicMapCellPosition->getMidPoint();
                        $self->{linePathAnimation}->paint($graphics, $point, $nextPoint, $tiledLayer);
                    }
                }
            }
        } catch ($e) {
            $self->{logUtil}->putF("Cleared Target", $self, 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{PAINT});
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::layer::AllBinaryGameLayerManager;

1;

