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

package org::allbinary::game::layer::waypoint::WaypointLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::AdvancedRTSGameLayer';



sub new {
    my ($class, $remoteInfo, $parentLayer, $groupInterface, $rootName, $name, $animationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y) = @_;
    my $self = $class->SUPER::new($remoteInfo, $parentLayer, 'org::allbinary::game::layer::AdvancedRTSProperties'->createProperties(), $groupInterface, $rootName, $name, 'org::allbinary::game::health::Health'->new(1000), 'org::allbinary::game::input::form::NullRTSFormInputFactory'->getInstance(), $animationInterfaceFactoryInterface, $animationInterfaceFactoryInterface, $animationInterfaceFactoryInterface, $animationInterfaceFactoryInterface, $animationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y, 'org::allbinary::game::view::TileLayerPositionIntoViewPosition'->new());
        # super(...) made $self above
        $self->setCollidableInferface('org::allbinary::game::layer::waypoint::CollidableWaypointBehavior'->new(1));
        $self->getWaypointBehavior()->setWaypoint('org::allbinary::game::layer::waypoint::Waypoint'->new($self, 'org::allbinary::media::audio::AttackSound'->getInstance()));
        $self->setAnimationInterface($self->{indexedButShouldBeRotationAnimationInterface});
    return $self;
}


sub construct {
    my ($self, $rtsPlayerLayerInterface) = @_;
        $self->{percentCompleteP} = 100;
        $self->initVisibility($rtsPlayerLayerInterface);
}


sub paint {
    my ($self, $graphics) = @_;
        if ($self->isVisible()) {
            $self->SUPER::paint($graphics);
        }
}


sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
        try {
            $self->{indexedButShouldBeRotationAnimationInterface}->nextFrame();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "processTick", $e);
        }
}


sub damage {
    my ($self, $damage, $damageType) = @_;
}


# throws Exception
sub getDamage {
    my ($self, $damageType) = @_;
        return 0;
}


# throws Exception
sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->SUPER::setDestroyed($destroyed);
        if ($self->isDestroyed()) {
            'org::allbinary::game::layer::waypoint::WaypointCellPositionHistory'->getInstance()->removeLayer($self);
        }
}


sub getType {
    my ($self) = @_;
        return 'org::allbinary::game::layer::waypoint::WaypointLayer'->getStaticType();
}


sub getStaticType {
    my ($class) = @_;
        return 4;
}


sub isSelfUpgradeable {
    my ($self) = @_;
        return 0;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::game::health::Health;
use org::allbinary::game::identification::Group;
use org::allbinary::game::input::form::NullRTSFormInputFactory;
use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::AdvancedRTSProperties;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::view::TileLayerPositionIntoViewPosition;
use org::allbinary::graphics::Rectangle;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::media::audio::AttackSound;
use org::allbinary::game::layer::waypoint::CollidableWaypointBehavior;
use org::allbinary::game::layer::waypoint::Waypoint;
use org::allbinary::game::layer::waypoint::WaypointCellPositionHistory;

1;

