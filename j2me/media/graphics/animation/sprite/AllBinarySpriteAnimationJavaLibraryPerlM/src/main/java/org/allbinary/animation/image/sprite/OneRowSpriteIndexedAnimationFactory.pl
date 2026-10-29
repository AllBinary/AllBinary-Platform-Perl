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

package org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{animationFactorySpriteScaleUtil} = 'org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil'->getInstance();
}


# throws Exception
sub createFactoryDX {
    my ($class, $image, $dx, $animationBehaviorFactory) = @_;
        my $oneRowSpriteIndexedAnimationFactory = 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $image->getHeight(), $image->getHeight(), 0, 0, $animationBehaviorFactory);
        $oneRowSpriteIndexedAnimationFactory->initW($dx);
        return $oneRowSpriteIndexedAnimationFactory;
}


# throws Exception
sub createFactoryDXY {
    my ($class, $image, $dx, $dy, $animationBehaviorFactory) = @_;
        my $oneRowSpriteIndexedAnimationFactory = 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $image->getHeight(), $image->getHeight(), 0, 0, $animationBehaviorFactory);
        $oneRowSpriteIndexedAnimationFactory->init($dx, $dy);
        return $oneRowSpriteIndexedAnimationFactory;
}


# throws Exception
sub createFactoryWH {
    my ($class, $image, $width, $height, $animationBehaviorFactory) = @_;
        return 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $width, $height, 0, 0, $animationBehaviorFactory);
}


# throws Exception
sub createFactory {
    my ($class, $image, $animationBehaviorFactory) = @_;
        return 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $image->getHeight(), $image->getHeight(), 0, 0, $animationBehaviorFactory);
}


sub new {
    my ($class, $image, $sequenceArray, $width, $height, $dx, $dy, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new($image, $sequenceArray, $width, $height, $dx, $dy, $animationBehaviorFactory);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub init {
    my ($self, $dx, $dy) = @_;
        $self->{animationFactoryInitializationVisitor}->{dx} = $dx;
        $self->{animationFactoryInitializationVisitor}->{dy} = $dy;
}


sub initW {
    my ($self, $dx) = @_;
        $self->init($dx, 0);
        $self->{animationFactoryInitializationVisitor}->{dx} += -(POSIX::floor(($self->{animationFactoryInitializationVisitor}->{width}) / (2 ** (2))));
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $sprite = $self->{animationFactorySpriteScaleUtil}->createImage($self->getImage(), $self->{animationFactoryInitializationVisitor}->{width}, $self->{animationFactoryInitializationVisitor}->{height}, $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        if ($self->{animationFactoryInitializationVisitor}->{dx} != 0 || $self->{animationFactoryInitializationVisitor}->{dy} != 0) {
            return 'org::allbinary::animation::image::sprite::AdjustedSpriteIndexedAnimation'->new($sprite, $self->getImage(), 'org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ZERO_ARRAY}, $self->{animationFactoryInitializationVisitor}->{dx}, $self->{animationFactoryInitializationVisitor}->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            return 'org::allbinary::animation::image::sprite::SpriteIndexedAnimation'->new($sprite, $self->getImage(), 'org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ZERO_ARRAY}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        }
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::graphics::color::BasicColorUtil;
use org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::animation::image::sprite::SpriteIndexedAnimation;
use org::allbinary::animation::image::sprite::AdjustedSpriteIndexedAnimation;

1;

