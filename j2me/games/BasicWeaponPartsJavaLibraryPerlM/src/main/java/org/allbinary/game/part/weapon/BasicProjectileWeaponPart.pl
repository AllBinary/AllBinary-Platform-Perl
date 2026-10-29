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

package org::allbinary::game::part::weapon::BasicProjectileWeaponPart;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::part::weapon::BasicWeaponPart';


sub _init_fields {
    my ($self) = @_;
    $self->{weaponLayerCircularStaticPool} = undef;
}


sub createBasicProjectileWeaponPart {
    my ($class, $animationInterface, $weaponLayerCircularStaticPool) = @_;
        return 'org::allbinary::game::part::weapon::BasicProjectileWeaponPart'->new($animationInterface, $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER, $weaponLayerCircularStaticPool, $org::allbinary::game::combat::weapon::WeaponProperties::NULL_WEAPON_PROPERTIES, 'org::allbinary::game::score::NoScoreable'->getInstance(), $org::allbinary::graphics::RelativeRelationship::NULL_RELATIVE_RELATIONSHIP);
}


sub new {
    my ($class, $animationInterface, $sourceLayerInterface, $weaponLayerCircularStaticPool, $weaponProperties, $scoreableInterface, $relativeRelationship) = @_;
    my $self = $class->SUPER::new($animationInterface, $sourceLayerInterface, $weaponProperties, $scoreableInterface, $relativeRelationship);
    $self->_init_fields();
        # super(...) made $self above
        $self->{weaponLayerCircularStaticPool} = $weaponLayerCircularStaticPool;
    return $self;
}


# throws Exception
sub processScore {
    my ($self, $allbinaryLayerManager, $angle, $otherAngle, $weaponProperties, $scoreableInterface) = @_;
        my $weaponLayer = $self->{weaponLayerCircularStaticPool}->getInstanceWeaponLayer($self->getOwnerLayerInterface(), $self->{relativeRelationship}->getX(), $self->{relativeRelationship}->getY(), $self->{relativeRelationship}->getZ(), $angle, $otherAngle, $weaponProperties, $scoreableInterface);
        $allbinaryLayerManager->append($weaponLayer);
}

use org::allbinary::animation::Animation;
use org::allbinary::game::combat::weapon::WeaponProperties;
use org::allbinary::game::layer::weapon::WeaponLayer;
use org::allbinary::game::layer::weapon::WeaponLayerCircularPool;
use org::allbinary::game::score::NoScoreable;
use org::allbinary::game::score::ScoreableInterface;
use org::allbinary::graphics::RelativeRelationship;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::game::part::weapon::BasicWeaponPart;

1;

