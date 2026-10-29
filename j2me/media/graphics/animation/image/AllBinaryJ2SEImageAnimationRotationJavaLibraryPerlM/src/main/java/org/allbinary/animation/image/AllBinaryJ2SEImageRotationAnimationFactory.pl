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

package org::allbinary::animation::image::AllBinaryJ2SEImageRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{angleIncrementP} = undef;
    $self->{resizeCanvasForRotation} = undef;
}


# throws Exception
sub createDXY {
    my ($class, $image, $width, $height, $dx, $dy, $angleIncrement, $animationBehaviorFactory, $resizeCanvasForRotation) = @_;
        my $imageRotationAnimationFactory = 'org::allbinary::animation::image::AllBinaryJ2SEImageRotationAnimationFactory'->new($image, $width, $height, $angleIncrement, $animationBehaviorFactory, $resizeCanvasForRotation);
        $imageRotationAnimationFactory->{animationFactoryInitializationVisitor}->{dx} = $dx;
        $imageRotationAnimationFactory->{animationFactoryInitializationVisitor}->{dy} = $dy;
        $imageRotationAnimationFactory->{animationFactoryInitializationVisitor}->{originalDx} = $dx;
        $imageRotationAnimationFactory->{animationFactoryInitializationVisitor}->{originalDy} = $dy;
        return $imageRotationAnimationFactory;
}


sub new {
    my ($class, $image, $width, $height, $angleIncrement, $animationBehaviorFactory, $resizeCanvasForRotation) = @_;
    my $self = $class->SUPER::new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $width, $height, 0, 0, $animationBehaviorFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->{angleIncrementP} = $angleIncrement;
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
        my $imageCopyUtil = 'org::allbinary::media::image::ImageCopyUtil'->getInstance();
        my $canvasImage = $self->getCanvasImage();
        my $scaledImage = $self->{animationFactoryImageScaleUtil}->createImage($canvasImage, $self->{animationFactoryInitializationVisitor}->{width}, $self->{animationFactoryInitializationVisitor}->{height}, $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        my $openGLUtil = 'org::allbinary::graphics::opengles::OpenGLUtil'->getInstance();
        $scaledImage = $openGLUtil->addImage($scaledImage);
        my $copyOfScaledImage = $imageCopyUtil->createImageForRotation($scaledImage);
        if ($self->{animationFactoryInitializationVisitor}->{dx} != 0 || $self->{animationFactoryInitializationVisitor}->{dy} != 0) {
            $self->{animationFactoryImageScaleUtil}->processAdjust($self);
            return 'org::allbinary::animation::image::AllBinaryAdjustedJ2SEImageRotationAnimation'->new($scaledImage, $copyOfScaledImage, 'org::allbinary::math::AngleInfo'->getInstance($self->{angleIncrementP}), 'org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}, $self->{animationFactoryInitializationVisitor}->{dx}, $self->{animationFactoryInitializationVisitor}->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            return 'org::allbinary::animation::image::AllBinaryJ2SEImageRotationAnimation'->new($scaledImage, $copyOfScaledImage, 'org::allbinary::math::AngleInfo'->getInstance($self->{angleIncrementP}), 'org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        }
}


sub getAngleIncrement {
    my ($self) = @_;
        return $self->{angleIncrementP};
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::graphics::opengles::OpenGLUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::image::ImageCopyUtil;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::animation::image::AllBinaryJ2SEImageRotationAnimation;
use org::allbinary::animation::image::AllBinaryAdjustedJ2SEImageRotationAnimation;

1;

