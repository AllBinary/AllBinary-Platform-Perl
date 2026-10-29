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

package org::allbinary::game::layer::unit::CollidableUnitBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::CollidableRTSBehavior';


sub _init_fields {
    my ($self) = @_;
    $self->{layerPartialCellPositionsUtil} = 'org::allbinary::game::layer::geographic::map::LayerPartialCellPositionsUtil'->getInstance();
    $self->{simpleSteeringVisitor} = 'org::allbinary::game::layer::unit::SimpleSteeringVisitor'->new();
}


sub new {
    my ($class, $collidable) = @_;
    my $self = $class->SUPER::new($collidable);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub collideNone {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        $self->chase($ownerLayer, $collidableInterfaceCompositeInterface);
        my $rtsLayer = $collidableInterfaceCompositeInterface;
        if ($rtsLayer->getType() == 'org::allbinary::game::layer::unit::UnitLayer'->getStaticType()) {
            $self->collideUnit($ownerLayer, $rtsLayer);
        }
}


# throws Exception
sub steer {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        my $ownerUnitLayer = $ownerLayer;
        my $unitLayer = $collidableInterfaceCompositeInterface;
        my $angleInfo2 = $unitLayer->getRotationAnimationInterface()->getAngleInfoP();
        my $angleInfo = $ownerUnitLayer->getRotationAnimationInterface()->getAngleInfoP();
        my $angle = $angleInfo->getAngle() - $angleInfo2->getAngle();
        if ($angle < 90 || $angle > 270) {
            return 1;
        } elsif ($angle >= 90 || $angle <= 270) {
            $ownerUnitLayer->getGameKeyEventList()->add('org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->getInstanceForKey($ownerUnitLayer, $javax::microedition::lcdui::Canvas::RIGHT));
            return 0;
        }
        die ("Error");
}


# throws Exception
sub chase {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        my $rtsLayer = $collidableInterfaceCompositeInterface;
        if ($rtsLayer->getType() == 'org::allbinary::game::layer::unit::UnitLayer'->getStaticType()) {
            if (!$self->{simpleSteeringVisitor}->getList()->contains($collidableInterfaceCompositeInterface)) {
                $self->{simpleSteeringVisitor}->getList()->add($collidableInterfaceCompositeInterface);
            }
            my $ownerUnitLayer = $ownerLayer;
            my $list = $ownerUnitLayer->getUnitWaypointBehavior()->getSteeringVisitorList();
            if (!$list->contains($self->{simpleSteeringVisitor})) {
                $list->add($self->{simpleSteeringVisitor});
            }
        }
}


# throws Exception
sub collideUnit {
    my ($self, $ownerLayer, $unitLayer) = @_;
        my $ownerUnitLayer = $ownerLayer;
        my $partialPositionList = 'org::allbinary::game::layer::unit::UnitLayer'->getPartialpositionlist();
        my $geographicMapCompositeInterface = $ownerUnitLayer->{allBinaryGameLayerManagerP};
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        my $basicGeographicMap = $geographicMapInterface;
        my $dropCellPositionHistory = 'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance();
        my $tiledLayerUtil = 'org::allbinary::game::layer::TiledLayerUtil'->getInstance();
        my $tiledLayer = $basicGeographicMap->getAllBinaryTiledLayer();
        if ($ownerLayer->getXP() < $unitLayer->getXP() && $ownerLayer->getX2() > $unitLayer->getXP()) {
            my $diff = $ownerLayer->getWidth() + 1;
            $self->{layerPartialCellPositionsUtil}->getAllDXY($basicGeographicMap, $ownerLayer, -$diff, 0, $partialPositionList);
            if (!$dropCellPositionHistory->anyCellPositionWithDrop($partialPositionList)) {
                my $x = $unitLayer->getXP() - $diff;
                my $y = $ownerLayer->getYP();
                $x = $tiledLayerUtil->keepOnMapX($tiledLayer, $x, $ownerLayer->getWidth());
                $y = $tiledLayerUtil->keepOnMapY($tiledLayer, $y, $ownerLayer->getHeight());
                $ownerLayer->setPosition($x, $y, $ownerLayer->getZP());
            }
            $self->{layerPartialCellPositionsUtil}->getAllDXY($basicGeographicMap, $unitLayer, $diff, 0, $partialPositionList);
            if (!$dropCellPositionHistory->anyCellPositionWithDrop($partialPositionList)) {
                my $x = $unitLayer->getXP() + $diff;
                my $y = $unitLayer->getYP();
                $x = $tiledLayerUtil->keepOnMapX($tiledLayer, $x, $unitLayer->getWidth());
                $y = $tiledLayerUtil->keepOnMapY($tiledLayer, $y, $unitLayer->getHeight());
                $unitLayer->setPosition($x, $y, $unitLayer->getZP());
            }
        }
        if ($ownerLayer->getYP() < $unitLayer->getYP() && $ownerLayer->getY2() > $unitLayer->getYP()) {
            my $diff = $ownerLayer->getHeight() + 1;
            $self->{layerPartialCellPositionsUtil}->getAllDXY($basicGeographicMap, $ownerLayer, 0, -$diff, $partialPositionList);
            if (!$dropCellPositionHistory->anyCellPositionWithDrop($partialPositionList)) {
                my $x = $ownerLayer->getXP();
                my $y = $unitLayer->getYP() - $diff;
                $x = $tiledLayerUtil->keepOnMapX($tiledLayer, $x, $ownerLayer->getWidth());
                $y = $tiledLayerUtil->keepOnMapY($tiledLayer, $y, $ownerLayer->getHeight());
                $ownerLayer->setPosition($x, $y, $ownerLayer->getZP());
            }
            $self->{layerPartialCellPositionsUtil}->getAllDXY($basicGeographicMap, $unitLayer, 0, $diff, $partialPositionList);
            if (!$dropCellPositionHistory->anyCellPositionWithDrop($partialPositionList)) {
                my $x = $unitLayer->getXP();
                my $y = $unitLayer->getYP() + $diff;
                $x = $tiledLayerUtil->keepOnMapX($tiledLayer, $x, $unitLayer->getWidth());
                $y = $tiledLayerUtil->keepOnMapY($tiledLayer, $y, $unitLayer->getHeight());
                $unitLayer->setPosition($x, $y, $unitLayer->getZP());
            }
        }
}
{
    package org::allbinary::game::layer::unit::SimpleSteeringVisitor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::game::layer::SteeringVisitor';
    

    sub new {
        my ($class) = @_;
        my $self = $class->SUPER::new();
        return $self;
    }
    

    sub visit {
        my ($self, $anyType) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            try {
                my $ownerLayer = $anyType;
                if ($self->getList()->size() > 0) {
                    my $allbinaryLayer = $self->getList()->get(0);
                    my $clear = $self->steer($ownerLayer, $allbinaryLayer);
                    if ($clear) {
                        $self->getList()->clear();
                        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
                    }
                    return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE};
                }
                return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
            } catch ($e) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonStrings->{EXCEPTION}, $self, "visit", $e);
                return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
            }
    }
    }


# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::layer::SteeringVisitor;
use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::game::layer::CollidableRTSBehavior;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::layer::TiledLayerUtil;
use org::allbinary::game::layer::geographic::map::LayerPartialCellPositionsUtil;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::layer::unit::UnitLayer;

1;

