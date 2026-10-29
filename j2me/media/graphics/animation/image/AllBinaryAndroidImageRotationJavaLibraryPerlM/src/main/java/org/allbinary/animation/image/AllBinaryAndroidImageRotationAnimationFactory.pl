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

package org::allbinary::animation::image::AllBinaryAndroidImageRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{angleIncrement} = undef;
    $self->{resizeCanvasForRotation} = undef;
}


# throws Exception
sub createFactory {
    my ($class, $image, $width, $height, $animationBehaviorFactory) = @_;
        return 'org::allbinary::animation::image::AllBinaryAndroidImageRotationAnimationFactory'->new($image, $width, $height, ((int(('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE} / 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->getGameControlFidelity())) + 32768) % 65536 - 32768), $animationBehaviorFactory, 0);
}


# throws Exception
sub createFactoryA {
    my ($class, $image, $width, $height, $angleIncrement, $animationBehaviorFactory) = @_;
        return 'org::allbinary::animation::image::AllBinaryAndroidImageRotationAnimationFactory'->new($image, $width, $height, $angleIncrement, $animationBehaviorFactory, 0);
}


# throws Exception
sub createFactoryU {
    my ($class, $image, $animationBehaviorFactory) = @_;
        my $androidImageRotationAnimationFactory = 'org::allbinary::animation::image::AllBinaryAndroidImageRotationAnimationFactory'->new($image, $image->getWidth(), $image->getHeight(), ((int(('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE} / 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->getGameControlFidelity())) + 32768) % 65536 - 32768), $animationBehaviorFactory, 0);
        $androidImageRotationAnimationFactory->init(-(POSIX::floor(($image->getWidth()) / (2 ** (2)))), -(POSIX::floor(($image->getHeight()) / (2 ** (2)))));
        return $androidImageRotationAnimationFactory;
}


# throws Exception
sub createFactoryDXYU {
    my ($class, $image, $dx, $dy, $animationBehaviorFactory) = @_;
        my $androidImageRotationAnimationFactory = 'org::allbinary::animation::image::AllBinaryAndroidImageRotationAnimationFactory'->new($image, $image->getWidth(), $image->getHeight(), ((int(('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE} / 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->getGameControlFidelity())) + 32768) % 65536 - 32768), $animationBehaviorFactory, 0);
        $androidImageRotationAnimationFactory->init($dx, $dy);
        return $androidImageRotationAnimationFactory;
}


# throws Exception
sub createFactoryADXY {
    my ($class, $image, $width, $height, $dx, $dy, $angleIncrement, $animationBehaviorFactory, $resizeCanvasForRotation) = @_;
        my $androidImageRotationAnimationFactory = 'org::allbinary::animation::image::AllBinaryAndroidImageRotationAnimationFactory'->new($image, $width, $height, $angleIncrement, $animationBehaviorFactory, $resizeCanvasForRotation);
        $androidImageRotationAnimationFactory->init($dx, $dy);
        return $androidImageRotationAnimationFactory;
}


sub init {
    my ($self, $dx, $dy) = @_;
        $self->{animationFactoryInitializationVisitor}->{dx} = $dx;
        $self->{animationFactoryInitializationVisitor}->{dy} = $dy;
        $self->{animationFactoryInitializationVisitor}->{originalDx} = $dx;
        $self->{animationFactoryInitializationVisitor}->{originalDy} = $dy;
}


sub new {
    my ($class, $image, $width, $height, $angleIncrement, $animationBehaviorFactory, $resizeCanvasForRotation) = @_;
    my $self = $class->SUPER::new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $width, $height, 0, 0, $animationBehaviorFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->{angleIncrement} = $angleIncrement;
        $self->{resizeCanvasForRotation} = $resizeCanvasForRotation;
    return $self;
}


# throws Exception
sub getCanvasImage {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($self->{resizeCanvasForRotation} && !$features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
            return 'org::allbinary::media::image::ImageCopyUtil'->getInstance()->createImageScale($self->getImage(), 1.44, 0);
        } else {
            return $self->getImage();
        }
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $canvasImage = $self->getCanvasImage();
        my $scaledImage = $self->{animationFactoryImageScaleUtil}->createImage($canvasImage, $self->{animationFactoryInitializationVisitor}->{width}, $self->{animationFactoryInitializationVisitor}->{height}, $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        my $copyOfScaledImage = 'org::allbinary::media::image::ImageCopyUtil'->getInstance()->createImage($scaledImage);
        if ($self->{animationFactoryInitializationVisitor}->{dx} != 0 || $self->{animationFactoryInitializationVisitor}->{dy} != 0) {
            $self->{animationFactoryImageScaleUtil}->processAdjust($self);
            return 'org::allbinary::animation::image::AllBinaryAdjustedAndroidImageRotationAnimation'->new($scaledImage, $copyOfScaledImage, 'org::allbinary::math::AngleInfo'->getInstance($self->{angleIncrement}), 'org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}, $self->{animationFactoryInitializationVisitor}->{dx}, $self->{animationFactoryInitializationVisitor}->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            return 'org::allbinary::animation::image::AllBinaryFlickerAndroidImageRotationAnimation'->new($scaledImage, $copyOfScaledImage, 'org::allbinary::math::AngleInfo'->getInstance($self->{angleIncrement}), 'org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::media::image::ImageCopyUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::animation::image::AllBinaryFlickerAndroidImageRotationAnimation;
use org::allbinary::animation::image::AllBinaryAdjustedAndroidImageRotationAnimation;

1;

