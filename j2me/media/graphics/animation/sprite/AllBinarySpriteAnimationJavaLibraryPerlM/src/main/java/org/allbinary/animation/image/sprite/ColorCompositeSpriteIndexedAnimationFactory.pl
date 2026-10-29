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

package org::allbinary::animation::image::sprite::ColorCompositeSpriteIndexedAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory','org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{animationFactorySpriteScaleUtil} = 'org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil'->getInstance();
    $self->{basicColorArray} = undef;
}


sub new {
    my ($class, $image, $basicColorArray, $width, $height, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $width, $height, 0, 0, $animationBehaviorFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->{basicColorArray} = $basicColorArray;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $sprite = $self->{animationFactorySpriteScaleUtil}->createImage($self->getImage(), $self->{animationFactoryInitializationVisitor}->{width}, $self->{animationFactoryInitializationVisitor}->{height}, $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        return 'org::allbinary::animation::image::sprite::SpriteIndexedAnimation'->new($sprite, $self->getImage(), $self->{basicColorArray}, $self->{animationBehaviorFactory}->getOrCreateInstance());
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
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::animation::image::sprite::SpriteIndexedAnimation;

1;

