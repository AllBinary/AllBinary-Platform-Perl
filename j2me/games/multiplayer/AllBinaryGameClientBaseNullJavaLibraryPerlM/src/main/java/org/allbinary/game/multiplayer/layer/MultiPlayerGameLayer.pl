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

package org::allbinary::game::multiplayer::layer::MultiPlayerGameLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer','org::allbinary::game::multiplayer::layer::MultiPlayerGameLayerInterface';



sub new {
    my ($class, $remoteInfo, $groupInterface, $name, $layerInfo, $viewPosition) = @_;
    my $self = $class->SUPER::new($groupInterface, $name, $layerInfo, $viewPosition);
        # super(...) made $self above
    return $self;
}


sub getMultiplayerBehavior {
    my ($self) = @_;
        return $org::allbinary::game::multiplayer::layer::MultiplayerBehavior::NULL_MULTIPLAYER_BEHAVIOR;
}


sub setPingInfo {
    my ($self, $show) = @_;
}


sub setFiring {
    my ($self, $firing) = @_;
}


sub getFiring {
    my ($self) = @_;
        return 0;
}

use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::graphics::Rectangle;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::multiplayer::layer::MultiPlayerGameLayerInterface;
use org::allbinary::game::multiplayer::layer::MultiplayerBehavior;

1;

