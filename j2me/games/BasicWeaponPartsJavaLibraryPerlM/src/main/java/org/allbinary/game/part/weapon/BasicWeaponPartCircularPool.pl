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

package org::allbinary::game::part::weapon::BasicWeaponPartCircularPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_BASIC_WEAPON_PART_CIRCULAR_POOL, 'java::lang::LazyStatic', sub { 'org::allbinary::game::part::weapon::BasicWeaponPartCircularPool'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{basicWeaponPart} = $org::allbinary::game::part::weapon::BasicWeaponPart::NULL_BASIC_WEAPON_PART;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub init {
    my ($self, $basicWeaponPartFactoryInterface) = @_;
        $self->{basicWeaponPart} = $basicWeaponPartFactoryInterface->getInstance();
}


# throws Exception
sub getInstance {
    my ($self, $sourceLayerInterface, $weaponProperties, $scoreableInterface, $relativeRelationship) = @_;
        $self->{basicWeaponPart}->init($sourceLayerInterface, $weaponProperties, $scoreableInterface, $relativeRelationship);
        return $self->{basicWeaponPart};
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::combat::weapon::WeaponProperties ();
use org::allbinary::game::score::ScoreableInterface ();
use org::allbinary::graphics::RelativeRelationship ();
use org::allbinary::layer::AllBinaryLayer ();
use org::allbinary::game::part::weapon::BasicWeaponPart ();

1;

