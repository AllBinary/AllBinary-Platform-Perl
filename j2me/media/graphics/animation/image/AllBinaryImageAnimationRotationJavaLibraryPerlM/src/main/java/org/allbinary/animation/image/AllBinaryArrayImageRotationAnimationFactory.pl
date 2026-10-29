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

package org::allbinary::animation::image::AllBinaryArrayImageRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{imageArray} = $javax::microedition::lcdui::NullImage::NULL_IMAGE_ARRAY;
    $self->{angleIncrement} = undef;
}


# throws Exception
sub createFactory {
    my ($class, $image, $dx, $dy) = @_;
        my $arrayImageRotationAnimationFactory = 'org::allbinary::animation::image::AllBinaryArrayImageRotationAnimationFactory'->new($image, $image->getWidth(), $image->getHeight(), 'org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE} / 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->getGameControlFidelity(), 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance());
        $arrayImageRotationAnimationFactory->initDXY($dx, $dy);
        return $arrayImageRotationAnimationFactory;
}


# throws Exception
sub createFactoryA {
    my ($class, $image, $dx, $dy, $angleIncrement) = @_;
        my $arrayImageRotationAnimationFactory = 'org::allbinary::animation::image::AllBinaryArrayImageRotationAnimationFactory'->new($image, $image->getWidth(), $image->getHeight(), $angleIncrement, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance());
        $arrayImageRotationAnimationFactory->initDXY($dx, $dy);
        return $arrayImageRotationAnimationFactory;
}


sub new {
    my ($class, $image, $width, $height, $angleIncrement, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $width, $height, 0, 0, $animationBehaviorFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->{angleIncrement} = $angleIncrement;
        $self->init();
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        $self->setImageArray('org::allbinary::media::image::ImageToRotationImageArrayUtil'->getInstance()->generate($self->getImage(), $self->getAngleIncrement(), int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE})));
}


sub initDXY {
    my ($self, $dx, $dy) = @_;
        $self->{animationFactoryInitializationVisitor}->{dx} = $dx;
        $self->{animationFactoryInitializationVisitor}->{dy} = $dy;
        $self->{animationFactoryInitializationVisitor}->{originalDx} = $dx;
        $self->{animationFactoryInitializationVisitor}->{originalDy} = $dy;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $scaledImageArray = [(undef) x (scalar(@{$self->{imageArray}}))];
        my $size = scalar(@{$scaledImageArray});
        my $image = $self->getImage();
        for (my $index = 0; $index < $size; $index++) {
            $scaledImageArray->[$index] = $self->{animationFactoryImageScaleUtil}->createImage($image, $image->getWidth(), $image->getHeight(), $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        }
        if ($self->{animationFactoryInitializationVisitor}->{dx} != 0 || $self->{animationFactoryInitializationVisitor}->{dy} != 0) {
            $self->{animationFactoryImageScaleUtil}->processAdjust($self);
            return 'org::allbinary::animation::image::AdjustedImageArrayRotationAnimation'->new($scaledImageArray, 'org::allbinary::math::AngleInfo'->getInstance(((int($self->getAngleIncrement()) + 32768) % 65536 - 32768)), int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}), $self->{animationFactoryInitializationVisitor}->{dx}, $self->{animationFactoryInitializationVisitor}->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            return 'org::allbinary::animation::image::ImageArrayRotationAnimation'->new($scaledImageArray, 'org::allbinary::math::AngleInfo'->getInstance(((int($self->getAngleIncrement()) + 32768) % 65536 - 32768)), int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}), $self->{animationBehaviorFactory}->getOrCreateInstance());
        }
}


sub setImageArray {
    my ($self, $imageArray) = @_;
        $self->{imageArray} = $imageArray;
}


sub getAngleIncrement {
    my ($self) = @_;
        return $self->{angleIncrement};
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::image::ImageToRotationImageArrayUtil;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::animation::image::ImageArrayRotationAnimation;
use org::allbinary::animation::image::AdjustedImageArrayRotationAnimation;

1;

