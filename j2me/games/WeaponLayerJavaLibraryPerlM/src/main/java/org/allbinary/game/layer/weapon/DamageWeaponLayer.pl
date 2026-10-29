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

package org::allbinary::game::layer::weapon::DamageWeaponLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::weapon::WeaponLayer';



sub new {
    my ($class, $name, $remoteInfo, $movement, $animationInterface, $destroyedAnimationInterface, $rectangle, $viewPosition, $username, $actorSessionId, $id, $multiPlayerType) = @_;
    my $self = $class->SUPER::new($name, $remoteInfo, $multiPlayerType, $movement, $animationInterface, $destroyedAnimationInterface, $rectangle, $viewPosition);
        # super(...) made $self above
        $self->setCollidableInferface('org::allbinary::game::layer::weapon::CollidableDamageWeaponBehavior'->new(1));
    return $self;
}

use org::allbinary::animation::Animation;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::graphics::Rectangle;
use org::allbinary::physics::movement::Movement;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::weapon::WeaponLayer;
use org::allbinary::game::layer::weapon::CollidableDamageWeaponBehavior;

1;

