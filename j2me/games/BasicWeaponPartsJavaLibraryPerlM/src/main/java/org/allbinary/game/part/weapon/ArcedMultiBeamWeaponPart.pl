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

package org::allbinary::game::part::weapon::ArcedMultiBeamWeaponPart;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::part::weapon::BasicWeaponPart';


sub _init_fields {
    my ($self) = @_;
    $self->{weaponLayerCircularStaticPool} = undef;
    $self->{total} = undef;
    $self->{TOTAL_ANGLE} = int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE});
}


sub new {
    my ($class, $animationInterface, $sourceLayerInterface, $weaponLayerCircularStaticPool, $total, $weaponProperties, $scoreableInterface, $relativeRelationship) = @_;
    my $self = $class->SUPER::new($animationInterface, $sourceLayerInterface, $weaponProperties, $scoreableInterface, $relativeRelationship);
    $self->_init_fields();
        # super(...) made $self above
        $self->{total} = $total;
        $self->{weaponLayerCircularStaticPool} = $weaponLayerCircularStaticPool;
    return $self;
}


# throws Exception
sub processScore {
    my ($self, $allbinaryLayerManager, $angle, $otherAngle, $weaponProperties, $scoreableInterface) = @_;
        my $increment = ((int((int(($self->{total} - 1) / $self->{TOTAL_ANGLE}))) + 32768) % 65536 - 32768);
        my $minAngle = ((int(($angle - (POSIX::floor((($increment * $self->{total})) / (2 ** (1)))))) + 32768) % 65536 - 32768);
        my $next = 0;
        my $weaponLayer = undef;
        for (my $index = 0; $index < $self->{total}; $index++) {
            $weaponLayer = $self->{weaponLayerCircularStaticPool}->getInstanceWeaponLayer($self->getOwnerLayerInterface(), $self->{relativeRelationship}->getX(), $self->{relativeRelationship}->getY(), 0, ($minAngle + $increment), $otherAngle, $weaponProperties, $scoreableInterface);
            $allbinaryLayerManager->append($weaponLayer);
            $next += $increment;
        }
}

use org::allbinary::animation::Animation;
use org::allbinary::game::combat::weapon::WeaponProperties;
use org::allbinary::game::layer::weapon::WeaponLayer;
use org::allbinary::game::layer::weapon::WeaponLayerCircularPool;
use org::allbinary::game::score::ScoreableInterface;
use org::allbinary::graphics::RelativeRelationship;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::math::AngleFactory;
use org::allbinary::game::part::weapon::BasicWeaponPart;

1;

