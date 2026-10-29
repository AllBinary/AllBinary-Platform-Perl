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

package org::allbinary::game::part::weapon::StraightMultiProjectileWeaponPart;
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
    $self->{noDecimalTrigTable} = 'org::allbinary::math::NoDecimalTrigTable'->getInstance();
}


sub createStraightMultiProjectileWeaponPart {
    my ($class, $animationInterface, $weaponLayerCircularStaticPool) = @_;
        return 'org::allbinary::game::part::weapon::StraightMultiProjectileWeaponPart'->new($animationInterface, $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER, $weaponLayerCircularStaticPool, 2, $org::allbinary::game::combat::weapon::WeaponProperties::NULL_WEAPON_PROPERTIES, 'org::allbinary::game::score::NoScoreable'->getInstance(), $org::allbinary::graphics::RelativeRelationship::NULL_RELATIVE_RELATIONSHIP);
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
        my $sourceLayerInterface = $self->getOwnerLayerInterface();
        my $reducedWidth = ($sourceLayerInterface->getWidth() * 8 / 10);
        my $halfWidth = (POSIX::floor(($reducedWidth) / (2 ** (1))));
        my $x = $self->{relativeRelationship}->getX();
        my $y = $self->{relativeRelationship}->getY();
        my $sine = 0;
        my $beamX = 0;
        my $cosine = 0;
        my $beamY = 0;
        my $weaponLayer = undef;
        my $increment = int($reducedWidth / ($self->{total} - 1));
        my $next = -$halfWidth;
        for (my $index = 0; $index < $self->{total}; $index++) {
            $sine = int(($next * $self->{noDecimalTrigTable}->sin($angle)));
            $beamX = int(($sine / $self->{noDecimalTrigTable}->{SCALE}));
            $cosine = int(($next * $self->{noDecimalTrigTable}->cos($angle)));
            $beamY = -int(($cosine / $self->{noDecimalTrigTable}->{SCALE}));
            $weaponLayer = $self->{weaponLayerCircularStaticPool}->getInstanceWeaponLayer($sourceLayerInterface, $x + $beamX, $y + $beamY, 0, $angle, $otherAngle, $weaponProperties, $scoreableInterface);
            $allbinaryLayerManager->append($weaponLayer);
            $next += $increment;
        }
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
use org::allbinary::math::NoDecimalTrigTable;
use org::allbinary::game::part::weapon::BasicWeaponPart;

1;

