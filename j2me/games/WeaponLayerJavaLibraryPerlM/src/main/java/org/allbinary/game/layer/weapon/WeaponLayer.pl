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

package org::allbinary::game::layer::weapon::WeaponLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::multiplayer::layer::MultiPlayerGameLayer','org::allbinary::game::tick::TickableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{animationInterface} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
    $self->{initAnimationInterface} = undef;
    $self->{destroyedAnimationInterface} = undef;
    $self->{sourceLayerInterface} = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
    $self->{totalDamage} = 0;
    $self->{initDamage} = 0;
    $self->{destroyed} = 1;
    $self->{scoreableInterface} = 'org::allbinary::game::score::NoScoreable'->getInstance();
    $self->{movement} = undef;
    $self->{weaponProperties} = $org::allbinary::game::combat::weapon::WeaponProperties::NULL_WEAPON_PROPERTIES;
    $self->{multiPlayerType} = undef;
    $self->{collidableWeaponBehavior} = 'org::allbinary::game::layer::weapon::CollidableWeaponBehavior'->getNullInstance();
}


sub new {
    my ($class, $name, $remoteInfo, $multiPlayerType, $movement, $animationInterface, $destroyedAnimationInterface, $rectangle, $viewPosition) = @_;
    my $self = $class->SUPER::new($remoteInfo, 'org::allbinary::game::identification::BasicGroupFactory'->getInstance()->{NONE_ARRAY}, $name, $rectangle, $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
        $self->{initAnimationInterface} = $animationInterface;
        $self->setAnimationInterface($animationInterface);
        $self->{destroyedAnimationInterface} = $destroyedAnimationInterface;
        $self->{movement} = $movement;
        $self->{multiPlayerType} = $multiPlayerType;
    return $self;
}


sub setCollidableInferface {
    my ($self, $collidableInferface) = @_;
        $self->SUPER::setCollidableInferface($collidableInferface);
        $self->{collidableWeaponBehavior} = $self->getCollidableInferface();
}


# throws Exception
sub initXYZ {
    my ($self, $x, $y, $z) = @_;
        $self->{x} = $x;
        $self->{y} = $y;
        $self->{z} = $z;
}


# throws Exception
sub init {
    my ($self, $sourceLayerInterface, $angle, $otherAngle, $weaponProperties, $scoreable) = @_;
        $self->setWeaponPropertiesP($weaponProperties);
        $self->setReadyForExplosion(0);
        $self->setAnimationInterface($self->getInitAnimationInterfaceP());
        $self->setOwnerLayerInterface($sourceLayerInterface);
        $self->{collidableWeaponBehavior}->init($sourceLayerInterface);
        $self->setGroupInterfaces();
        if (defined($scoreable)) {
            $self->{scoreableInterface} = $scoreable;
        }
        $self->{totalDamage} = 0;
        $self->{initDamage} = $weaponProperties->getDamage();
        $self->setDestroyed(0);
        $self->{movement}->init($weaponProperties->getSpeed(), $angle, $otherAngle);
}


sub setGroupInterfaces {
    my ($self) = @_;
        my $basicGroupFactory = 'org::allbinary::game::identification::BasicGroupFactory'->getInstance();
        if ($self->{sourceLayerInterface}->getGroupInterface()->[0] == $basicGroupFactory->{ENEMY}) {
            $self->setGroupInterface($basicGroupFactory->{ENEMY_ARRAY});
        } else {
            $self->setGroupInterface($self->{sourceLayerInterface}->getGroupInterface());
        }
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->isExhausted() && !$self->isDestroyed()) {
            if ($self->isReadyForExplosion()) {
                my $indexedAnimationInterface = $self->getAnimationInterface();
                my $currentFrame = $indexedAnimationInterface->getFrame();
                if ($currentFrame < $indexedAnimationInterface->getAnimationSize() - 1) {
                    $indexedAnimationInterface->nextFrame();
                } else {
                    $self->setDestroyed(1);
                }
            } else {
                my $collidableWeaponBehavior = $self->getCollidableInferface();
                if ($collidableWeaponBehavior->isCollided()) {
                    $self->setAnimationInterface($self->{destroyedAnimationInterface});
                    $self->getMovement()->stop();
                    $self->setReadyForExplosion(1);
                } else {
                    $self->setDestroyed(1);
                }
            }
        }
        $self->{movement}->process($self);
        $self->{totalDamage} += $self->{weaponProperties}->getDissipation();
}


sub isDestroyed {
    my ($self) = @_;
        return $self->{destroyed};
}


sub damage {
    my ($self, $damage, $damageType) = @_;
        $self->{totalDamage} += $damage * $damage;
}


sub givePoints {
    my ($self, $total) = @_;
        $self->{scoreableInterface}->addPoints('org::allbinary::game::configuration::GameConfigurationUtil'->getInstance()->getCompetitionValue() * $total);
}


sub isExhausted {
    my ($self) = @_;
        if ($self->{totalDamage} > $self->getInitDamage() || $self->{totalDamage} < 0) {
            return 1;
        } else {
            return 0;
        }
}


sub getDamage {
    my ($self, $damageType) = @_;
        if (!$self->isExhausted()) {
            my $total = $self->getInitDamage() - $self->{totalDamage};
            $self->givePoints($total);
            return $total;
        }
        return 0;
}


sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->{destroyed} = $destroyed;
        if ($self->isDestroyed()) {
            $self->{scoreableInterface} = 'org::allbinary::game::score::NoScoreable'->getInstance();
            'org::allbinary::game::combat::destroy::DestroyedLayerProcessor'->getInstance()->add($self);
        }
}


sub getInitDamage {
    my ($self) = @_;
        return $self->{initDamage};
}


sub setAnimationInterface {
    my ($self, $animationInterface) = @_;
        $self->{animationInterface} = $animationInterface;
}


sub getAnimationInterface {
    my ($self) = @_;
        return $self->{animationInterface};
}


sub getInitAnimationInterfaceP {
    my ($self) = @_;
        return $self->{initAnimationInterface};
}


sub setInitAnimationInterfaceP {
    my ($self, $initAnimationInterface) = @_;
        $self->{initAnimationInterface} = $initAnimationInterface;
}


sub getDestroyedAnimationInterface {
    my ($self) = @_;
        return $self->{destroyedAnimationInterface};
}


sub getOwnerLayerInterface {
    my ($self) = @_;
        return $self->{sourceLayerInterface};
}


sub setOwnerLayerInterface {
    my ($self, $sourceLayerInterface) = @_;
        $self->{sourceLayerInterface} = $sourceLayerInterface;
}


sub paint {
    my ($self, $graphics) = @_;
        my $viewPosition = $self->getViewPosition();
        $self->{animationInterface}->paintXY($graphics, $viewPosition->getX() - $self->getHalfWidth(), $viewPosition->getY() - $self->getHalfHeight());
}


sub paintThreed {
    my ($self, $graphics) = @_;
        my $viewPosition = $self->getViewPosition();
        $self->{animationInterface}->paintThreedXYZ($graphics, $viewPosition->getX() - $self->getHalfWidth(), $viewPosition->getY() - $self->getHalfHeight(), $viewPosition->getZ() - $self->getHalfDepth());
}


sub getMovement {
    my ($self) = @_;
        return $self->{movement};
}


sub setMovement {
    my ($self, $movement) = @_;
        $self->{movement} = $movement;
}


sub getType {
    my ($self) = @_;
        return 'org::allbinary::game::layer::weapon::WeaponLayer'->getStaticType();
}


sub getStaticType {
    my ($class) = @_;
        return 0;
}


sub getMultiPlayerType {
    my ($self) = @_;
        return $self->{multiPlayerType};
}


sub setWeaponPropertiesP {
    my ($self, $weaponProperties) = @_;
        $self->{weaponProperties} = $weaponProperties;
}


sub getWeaponPropertiesP {
    my ($self) = @_;
        return $self->{weaponProperties};
}


sub implmentsTickableInterface {
    my ($self) = @_;
        return 1;
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
        $self->{initAnimationInterface}->set($gl);
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::game::collision::CollidableBaseBehavior;
use org::allbinary::game::combat::destroy::DestroyedLayerProcessor;
use org::allbinary::game::combat::weapon::WeaponProperties;
use org::allbinary::game::configuration::GameConfigurationUtil;
use org::allbinary::game::identification::BasicGroupFactory;
use org::allbinary::game::multiplayer::layer::MultiPlayerGameLayer;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::game::score::NoScoreable;
use org::allbinary::game::score::ScoreableInterface;
use org::allbinary::game::tick::TickableInterface;
use org::allbinary::graphics::Rectangle;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::physics::movement::Movement;
use org::allbinary::view::ViewPosition;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::weapon::CollidableWeaponBehavior;

1;

