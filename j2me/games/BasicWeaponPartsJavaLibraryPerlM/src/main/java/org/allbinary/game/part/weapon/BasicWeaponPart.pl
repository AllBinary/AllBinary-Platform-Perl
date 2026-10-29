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

package org::allbinary::game::part::weapon::BasicWeaponPart;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::part::PartInterface','org::allbinary::game::part::weapon::SalvoInterface';

our $NULL_BASIC_WEAPON_PART = 'org::allbinary::game::part::weapon::BasicWeaponPart'->createBasicWeaponPart('org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0));

sub _init_fields {
    my ($self) = @_;
    $self->{animationInterface} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
    $self->{ownerLayerInterface} = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
    $self->{weaponProperties} = $org::allbinary::game::combat::weapon::WeaponProperties::NULL_WEAPON_PROPERTIES;
    $self->{scoreableInterface} = 'org::allbinary::game::score::NoScoreable'->getInstance();
    $self->{relativeRelationship} = $org::allbinary::graphics::RelativeRelationship::NULL_RELATIVE_RELATIONSHIP;
}


sub createBasicWeaponPart {
    my ($class, $animationInterface) = @_;
        return 'org::allbinary::game::part::weapon::BasicWeaponPart'->new($animationInterface, $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER, $org::allbinary::game::combat::weapon::WeaponProperties::NULL_WEAPON_PROPERTIES, 'org::allbinary::game::score::NoScoreable'->getInstance(), $org::allbinary::graphics::RelativeRelationship::NULL_RELATIVE_RELATIONSHIP);
}


sub new {
    my ($class, $animationInterface, $sourceLayerInterface, $weaponProperties, $scoreableInterface, $relativeRelationship) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init($sourceLayerInterface, $weaponProperties, $scoreableInterface, $relativeRelationship);
        $self->setAnimationInterface($animationInterface);
    return $self;
}


sub init {
    my ($self, $sourceLayerInterface, $weaponProperties, $scoreableInterface, $relativeRelationship) = @_;
        $self->setOwnerLayerInterface($sourceLayerInterface);
        $self->setWeaponProperties($weaponProperties);
        $self->{scoreableInterface} = $scoreableInterface;
        $self->{relativeRelationship} = $relativeRelationship;
}


# throws Exception
sub process {
    my ($self, $allbinaryLayerManager, $angle, $otherAngle) = @_;
        $self->processScore($allbinaryLayerManager, $angle, $otherAngle, $self->getWeaponProperties(), $self->{scoreableInterface});
}


# throws Exception
sub processScore {
    my ($self, $allbinaryLayerManager, $angle, $otherAngle, $weaponProperties, $scoreableInterface) = @_;
        die ('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED});
}


sub getOwnerLayerInterface {
    my ($self) = @_;
        return $self->{ownerLayerInterface};
}


sub setOwnerLayerInterface {
    my ($self, $ownerLayerInterface) = @_;
        $self->{ownerLayerInterface} = $ownerLayerInterface;
}


sub getAnimationInterface {
    my ($self) = @_;
        return $self->{animationInterface};
}


sub setAnimationInterface {
    my ($self, $animationInterface) = @_;
        $self->{animationInterface} = $animationInterface;
}


sub paint {
    my ($self, $graphics) = @_;
        my $viewPosition = $self->getOwnerLayerInterface()->getViewPosition();
        my $viewX = $viewPosition->getX();
        my $viewY = $viewPosition->getY();
        $self->{animationInterface}->paintXY($graphics, $viewX, $viewY);
}


sub paintThreed {
    my ($self, $graphics) = @_;
}


sub getWeaponProperties {
    my ($self) = @_;
        return $self->{weaponProperties};
}


sub setWeaponProperties {
    my ($self, $weaponProperties) = @_;
        $self->{weaponProperties} = $weaponProperties;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::game::combat::weapon::WeaponProperties;
use org::allbinary::game::part::PartInterface;
use org::allbinary::game::score::NoScoreable;
use org::allbinary::game::score::ScoreableInterface;
use org::allbinary::graphics::RelativeRelationship;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::string::CommonStrings;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::part::weapon::SalvoInterface;

1;

