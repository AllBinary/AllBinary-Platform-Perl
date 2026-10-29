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

package org::allbinary::game::layer::weapon::SimpleWeaponLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::weapon::WeaponLayer';



# throws Exception
sub createDestroyed {
    my ($class) = @_;
        return 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->getProcedural('org::allbinary::game::combat::damage::ExplosionResources'->getInstance()->{THIRD_EXPLOSION_RESOURCE})->getInstanceAnimation('org::allbinary::animation::NullIndexedAnimationFactory'->getFactoryInstance()->getInstance(0));
}


sub new {
    my ($class, $name, $remoteInfo, $multiPlayerType, $movement, $animationInterface, $destroyedAnimationInterface, $rectangle, $viewPosition) = @_;
    my $self = $class->SUPER::new($name, $remoteInfo, $multiPlayerType, $movement, $animationInterface, $destroyedAnimationInterface, $rectangle, $viewPosition);
        # super(...) made $self above
        $self->setCollidableInferface('org::allbinary::game::layer::weapon::CollidableWeaponBehavior'->new(1));
    return $self;
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::animation::NullIndexedAnimationFactory;
use org::allbinary::game::combat::damage::ExplosionResources;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::graphics::Rectangle;
use org::allbinary::physics::movement::Movement;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::weapon::WeaponLayer;
use org::allbinary::game::layer::weapon::CollidableWeaponBehavior;

1;

