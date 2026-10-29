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

package org::allbinary::game::layer::geological::resources::ResourceWaypointLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::waypoint::WaypointLayer';



sub new {
    my ($class, $remoteInfo, $parentLayer, $groupInterface, $rootName, $name, $animationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y) = @_;
    my $self = $class->SUPER::new($remoteInfo, $parentLayer, $groupInterface, $rootName, $name, $animationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y);
        # super(...) made $self above
    return $self;
}


sub createHudPaintable {
    my ($self) = @_;
        my $rtsLayerHudPaintable = 'org::allbinary::game::layer::geological::resources::GeologicalResourceInfoHudPaintableSingleton'->getInstance();
        $rtsLayerHudPaintable->setBasicColorP($self->{allBinaryGameLayerManagerP}->getForegroundBasicColor());
        $rtsLayerHudPaintable->setRtsLayer($self);
        return $rtsLayerHudPaintable;
}


sub getHudPaintable {
    my ($self) = @_;
        my $rtsLayerHudPaintable = 'org::allbinary::game::layer::geological::resources::GeologicalResourceInfoHudPaintableSingleton'->getInstance();
        return $rtsLayerHudPaintable;
}

use org::allbinary::game::layer::SelectionHudPaintable;
use org::allbinary::game::layer::waypoint::WaypointLayer;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::graphics::Rectangle;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::game::layer::geological::resources::GeologicalResourceInfoHudPaintableSingleton;

1;

