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

package org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory','org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{animationFactorySpriteScaleUtil} = 'org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil'->getInstance();
}


# throws Exception
sub createWHDY {
    my ($class, $image, $dx, $dy, $animationBehaviorFactory) = @_;
        my $spriteRotationAnimationFactory = 'org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimationFactory'->new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), (POSIX::floor(($image->getHeight()) / (2 ** (2)))), (POSIX::floor(($image->getHeight()) / (2 ** (2)))), 0, 0, $animationBehaviorFactory);
        $spriteRotationAnimationFactory->initWH($dx, $dy);
        return $spriteRotationAnimationFactory;
}


# throws Exception
sub createWH {
    my ($class, $image, $animationBehaviorFactory) = @_;
        return 'org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimationFactory'->createWHDY($image, 0, 0, $animationBehaviorFactory);
}


# throws Exception
sub createDXY {
    my ($class, $image, $dx, $dy, $animationBehaviorFactory) = @_;
        my $spriteRotationAnimationFactory = 'org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimationFactory'->new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $image->getHeight(), $image->getHeight(), 0, 0, $animationBehaviorFactory);
        $spriteRotationAnimationFactory->init($dx, $dy);
        return $spriteRotationAnimationFactory;
}


# throws Exception
sub createDXYQ {
    my ($class, $image, $dx, $dy, $animationBehaviorFactory) = @_;
        my $spriteRotationAnimationFactory = 'org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimationFactory'->new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), (POSIX::floor(($image->getHeight()) / (2 ** (2)))), (POSIX::floor(($image->getHeight()) / (2 ** (2)))), 0, 0, $animationBehaviorFactory);
        $spriteRotationAnimationFactory->init($dx, $dy);
        return $spriteRotationAnimationFactory;
}


# throws Exception
sub createQ {
    my ($class, $image, $animationBehaviorFactory) = @_;
        return 'org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimationFactory'->new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), (POSIX::floor(($image->getHeight()) / (2 ** (2)))), (POSIX::floor(($image->getHeight()) / (2 ** (2)))), 0, 0, $animationBehaviorFactory);
}


# throws Exception
sub createWHF {
    my ($class, $image, $animationBehaviorFactory) = @_;
        return 'org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimationFactory'->new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $image->getHeight(), $image->getHeight(), 0, 0, $animationBehaviorFactory);
}


sub new {
    my ($class, $image, $sequenceArray, $width, $height, $dx, $dy, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new($image, $sequenceArray, $width, $height, $dx, $dy, $animationBehaviorFactory);
    $self->_init_fields();
        # super(...) made $self above
        if ($animationBehaviorFactory == 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()) {
            'org::allbinary::logic::communication::log::ForcedLogUtil'->log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", $self);
        }
    return $self;
}


sub init {
    my ($self, $dx, $dy) = @_;
        $self->{animationFactoryInitializationVisitor}->{dx} = $dx;
        $self->{animationFactoryInitializationVisitor}->{dy} = $dy;
}


sub initWH {
    my ($self, $dx, $dy) = @_;
        $self->init($dx, $dy);
        $self->{animationFactoryInitializationVisitor}->{dx} += -$self->{animationFactoryInitializationVisitor}->{width} / 5;
        $self->{animationFactoryInitializationVisitor}->{dy} += -$self->{animationFactoryInitializationVisitor}->{height} / 5;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $sprite = $self->{animationFactorySpriteScaleUtil}->createImage($self->getImage(), $self->{animationFactoryInitializationVisitor}->{width}, $self->{animationFactoryInitializationVisitor}->{height}, $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        if ($self->{animationFactoryInitializationVisitor}->{dx} != 0 || $self->{animationFactoryInitializationVisitor}->{dy} != 0) {
            return 'org::allbinary::animation::image::sprite::AllBinaryAdjustedSpriteRotationAnimation'->new($sprite, $self->getImage(), $self->{animationFactoryInitializationVisitor}->{dx}, $self->{animationFactoryInitializationVisitor}->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            return 'org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimation'->new($sprite, $self->getImage(), $self->{animationBehaviorFactory}->getOrCreateInstance());
        }
}


# throws Exception
sub getInstanceAnimation {
    my ($self, $animationInterface) = @_;
        return $self->getInstance(0);
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimation;
use org::allbinary::animation::image::sprite::AllBinaryAdjustedSpriteRotationAnimation;

1;

